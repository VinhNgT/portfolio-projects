import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/logging/logger_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admob_provider.g.dart';

@Riverpod(keepAlive: true)
class AdMobController extends _$AdMobController {
  final MobileAds _mobileAds = MobileAds.instance;
  final Map<AdUnit, Ad> _loadedAds = {};
  final Duration _defaultErrorRetryDelay = const Duration(minutes: 1);

  Logger get _logger => ref.read(loggerProvider);

  /// Initializes AdMob and preload all of the ads.
  @override
  Map<AdUnit, Ad> build() {
    _mobileAds.initialize();
    for (final adUnit in AdUnit.values) {
      _refreshAd(adUnit);
    }

    ref.onDispose(() {
      for (final ad in _loadedAds.values) {
        ad.dispose();
      }
    });
    return _loadedAds;
  }

  void openAdInspector() {
    _mobileAds.openAdInspector((_) {});
  }

  /// Refreshes the ad for the given [adUnit].
  ///
  /// If [delay] is provided, the ad will be refreshed after the delay.
  void _refreshAd(AdUnit adUnit, [Duration delay = Duration.zero]) {
    if (delay != Duration.zero) {
      _logger.w(
        'Delay $adUnit new ad loading for ${delay.inMinutes} minute(s)',
      );
      Future.delayed(delay, () => _refreshAd(adUnit));
      return;
    }

    _removeAd(adUnit);
    _logger.i('Loading new ad for $adUnit');

    switch (adUnit.type) {
      case const (BannerAd):
        _loadBannerAd(adUnit);
      case const (RewardedAd):
        _loadRewardedAd(adUnit);
    }
  }

  /// Adds the [ad] to the [_loadedAds] map.
  ///
  /// If [ad] is already in [_loadedAds], it is considered an update and no
  /// change will be made because AdMob handles updating ads internally.
  void _addAd(AdUnit adUnit, Ad ad) {
    final oldAd = _loadedAds[adUnit];
    if (oldAd == ad) {
      _logger.i('$adUnit ad updated');
      return;
    }

    oldAd?.dispose();
    _loadedAds[adUnit] = ad;
    ref.notifyListeners();

    _logger.i('$adUnit new ad loaded');
  }

  /// Removes the ad for the given [adUnit] from the [_loadedAds] map.
  void _removeAd(AdUnit adUnit) {
    final ad = _loadedAds.remove(adUnit);

    if (ad != null) {
      ad.dispose();
      ref.notifyListeners();
      _logger.i('$adUnit ad removed');
    }
  }

  /// Loads a new banner ad for the given [adUnit].
  ///
  /// If the ad fails to load, it will be retried after the default error retry
  /// delay.
  void _loadBannerAd(AdUnit adUnit) {
    BannerAd(
      adUnitId: adUnit.id,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) => _addAd(adUnit, ad),
        onAdFailedToLoad: (ad, err) {
          _logger.e('BannerAd failed to load', error: err);
          _removeAd(adUnit);
          _refreshAd(adUnit, _defaultErrorRetryDelay);
        },
      ),
    ).load();
  }

  /// Loads a new rewarded ad for the given [adUnit].
  ///
  /// If the ad fails to load, it will be retried after the default error retry
  /// delay.
  void _loadRewardedAd(AdUnit adUnit) {
    RewardedAd.load(
      adUnitId: adUnit.id,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdFailedToShowFullScreenContent: (ad, err) {
              if (err.code == 1) {
                _logger.w('The ad has already been shown', error: err);
                return;
              }

              _logger.e('RewardedAd failed to show', error: err);
              _removeAd(adUnit);
              _refreshAd(adUnit, _defaultErrorRetryDelay);
            },
            onAdDismissedFullScreenContent: (ad) => _refreshAd(adUnit),
          );

          _addAd(adUnit, ad);
        },
        onAdFailedToLoad: (LoadAdError error) {
          _logger.e('RewardedAd failed to load', error: error);
        },
      ),
    );
  }
}

@riverpod
RewardedAd? rewardedAd(RewardedAdRef ref, AdUnit adUnit) {
  if (adUnit.type != RewardedAd) {
    throw ArgumentError('adUnit must be a RewardedAd');
  }

  final ad = ref.watch(adMobControllerProvider.select((ads) => ads[adUnit]));
  return ad as RewardedAd?;
}

@riverpod
BannerAd? bannerAd(BannerAdRef ref, AdUnit adUnit) {
  if (adUnit.type != BannerAd) {
    throw ArgumentError('adUnit must be a BannerAd');
  }

  final ad = ref.watch(adMobControllerProvider.select((ads) => ads[adUnit]));
  return ad as BannerAd?;
}
