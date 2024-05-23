import 'package:driving_license/backend/ads/ad_loader.dart';
import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/backend/ads/delayed_callbacks.dart';
import 'package:driving_license/logging/logger_provider.dart';
import 'package:driving_license/networking/connectivity_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admob_provider.g.dart';

@Riverpod(keepAlive: true)
MobileAds adMob(AdMobRef ref) {
  return MobileAds.instance;
}

@Riverpod(keepAlive: true)
class AdMobController extends _$AdMobController {
  final Duration _defaultErrorRetryDuration = const Duration(minutes: 1);
  final DelayedCallbacks _retryRefreshPendings = DelayedCallbacks();

  final Map<AdUnit, AdLoader> _adLoaders = {};

  MobileAds get _mobileAds => ref.read(adMobProvider);
  Logger get _logger => ref.read(loggerProvider);
  AsyncValue get _hasConnectivity => ref.read(hasConnectivityProvider);

  /// Initializes AdMob and preload all of the ads.
  @override
  Map<AdUnit, AdLoader> build() {
    _mobileAds.initialize();
    _initLoaders();

    if (_hasConnectivity.value ?? false) {
      _loadAll();
    }

    ref.listen(hasConnectivityProvider, (_, next) {
      if (!next.isLoading && next.requireValue) {
        // When connectivity is restored, ignore all delays and
        // retry loading all ads.
        _retryRefreshPendings.clearAll();
        _loadAll();
      }
    });

    ref.onDispose(_disposeAll);
    return _adLoaders;
  }

  void _initLoaders() {
    for (final adUnit in AdUnit.values) {
      switch (adUnit.type) {
        case const (BannerAd):
          _adLoaders[adUnit] = BannerAdLoader(
            adUnit: adUnit,
            onAdLoading: () {
              _logger.i('Loading $adUnit ad');
            },
            onAdLoaded: (_) {
              _logger.i('$adUnit ad loaded');
              ref.notifyListeners();
            },
            onAdUpdated: (_) {
              _logger.i('$adUnit ad updated');
            },
            onAdError: (err, st) {
              _adErrorHandler(adUnit, err, st);
              ref.notifyListeners();
            },
            onAdDisposed: () {
              ref.notifyListeners();
              _logger.i('$adUnit ad disposed');
            },
          );

        case const (RewardedAd):
          _adLoaders[adUnit] = RewardedAdLoader(
            adUnit: adUnit,
            onAdLoading: () {
              _logger.i('Loading $adUnit ad');
            },
            onAdLoaded: (_) {
              _logger.i('$adUnit ad loaded');
              ref.notifyListeners();
            },
            onAdError: (err, st) {
              _adErrorHandler(adUnit, err, st);
              ref.notifyListeners();
            },
            onAdDisposed: () {
              ref.notifyListeners();
              _logger.i('$adUnit ad disposed');
            },
          );
      }
    }
  }

  void _adErrorHandler(AdUnit adUnit, AdError err, StackTrace st) {
    _logger.e(
      '$adUnit ad failed to load',
      error: err,
      stackTrace: st,
    );

    if (!_hasConnectivity.requireValue) {
      _logger.w('No connectivity, pause $adUnit new ad loading');
      return;
    }

    _logger.w(
      'Network issue detected. Attempting to reload $adUnit ad in '
      '${_defaultErrorRetryDuration.inMinutes} minute(s).',
    );

    _retryRefreshPendings.add(
      adUnit,
      _defaultErrorRetryDuration,
      () {
        _logger.i('Retrying to load $adUnit ad');
        _load(adUnit);
      },
    );
  }

  void _load(AdUnit adUnit) {
    if (!_adLoaders.containsKey(adUnit)) {
      throw ArgumentError('Loader for $adUnit is not initialized');
    }
    _adLoaders[adUnit]!.load();
  }

  void _loadAll() {
    for (final adLoader in _adLoaders.values) {
      adLoader.load();
    }
  }

  void _disposeAll() {
    for (final adLoader in _adLoaders.values) {
      adLoader.dispose();
    }
  }
}

@riverpod
RewardedAd? rewardedAd(RewardedAdRef ref, AdUnit adUnit) {
  if (adUnit.type != RewardedAd) {
    throw ArgumentError('adUnit must be a RewardedAd');
  }

  final ad =
      ref.watch(adMobControllerProvider.select((ads) => ads[adUnit]?.loadedAd));
  return ad as RewardedAd?;
}

@riverpod
BannerAd? bannerAd(BannerAdRef ref, AdUnit adUnit) {
  if (adUnit.type != BannerAd) {
    throw ArgumentError('adUnit must be a BannerAd');
  }

  final ad =
      ref.watch(adMobControllerProvider.select((ads) => ads[adUnit]?.loadedAd));
  return ad as BannerAd?;
}
