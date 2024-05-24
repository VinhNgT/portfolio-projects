import 'dart:async';

import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdLoader {
  Ad? get loadedAd;

  void loadAd({bool forceReload = false});
  void dispose();
}

class RewardedAdLoader implements AdLoader {
  RewardedAdLoader({
    required this.adUnit,
    this.onAdLoading,
    this.onAdLoaded,
    this.onAdError,
    this.onAdDisposed,
  }) : assert(adUnit.type == RewardedAd);

  final AdUnit adUnit;
  final void Function()? onAdLoading;
  final void Function(RewardedAd ad)? onAdLoaded;
  final void Function(AdError err, StackTrace st)? onAdError;
  final void Function()? onAdDisposed;

  bool isLoading = false;

  RewardedAd? _loadedAd;

  @override
  RewardedAd? get loadedAd => _loadedAd;

  @override
  void loadAd({bool forceReload = false}) async {
    if (isLoading) {
      debugPrint('$adUnit ad is loading, ignore load request');
      return;
    }

    if (_loadedAd != null && !forceReload) {
      debugPrint('$adUnit ad is already loaded, ignore load request');
      return;
    }

    isLoading = true;
    dispose();
    onAdLoading?.call();
    _setupAdListener();
  }

  @override
  void dispose() {
    if (_loadedAd == null) {
      return;
    }

    _loadedAd?.dispose();
    _loadedAd = null;
    onAdDisposed?.call();
  }

  void _setupAdListener() async {
    try {
      final ad = await _getAd();
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdFailedToShowFullScreenContent: (ad, err) {
          // ignore: only_throw_errors
          throw err;
        },
        onAdDismissedFullScreenContent: (ad) {
          // Force reload because the previous ad was watched and therefore
          // no longer needed.
          loadAd(forceReload: true);
        },
      );

      _loadedAd = ad;
      onAdLoaded?.call(ad);
    } on AdError catch (e, st) {
      onAdError?.call(e, st);
      dispose();
    } finally {
      isLoading = false;
    }
  }

  Future<RewardedAd> _getAd() {
    final completer = Completer<RewardedAd>();

    RewardedAd.load(
      adUnitId: adUnit.id,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => completer.complete(ad),
        onAdFailedToLoad: (err) =>
            completer.completeError(err, StackTrace.current),
      ),
    );

    return completer.future;
  }
}
