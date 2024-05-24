import 'dart:async';

import 'package:driving_license/backend/ads/ad_status_logger.dart';
import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/logging/logger_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rewarded_ad_provider.g.dart';

@Riverpod(keepAlive: true)
class RewardedAdFuture extends _$RewardedAdFuture with AdStatusLogger {
  Logger get _logger => ref.read(loggerProvider);
  bool _isWatched = false;

  @override
  FutureOr<RewardedAd> build(AdUnit adUnit) {
    ref.listenSelf(
      (previous, next) => log(_logger, adUnit, previous, next),
    );

    ref.onAddListener(() {
      if (_isWatched) {
        _isWatched = false;
        ref.invalidateSelf();
      }
    });

    return _getAd();
  }

  Future<RewardedAd> _getAd() {
    final completer = Completer<RewardedAd>();

    RewardedAd.load(
      adUnitId: adUnit.id,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdFailedToShowFullScreenContent: (ad, err) {
              ad.dispose();
            },
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdShowedFullScreenContent: (ad) {
              _isWatched = true;
            },
          );

          completer.complete(ad);
        },
        onAdFailedToLoad: (LoadAdError error) {
          completer.completeError(error, StackTrace.current);
        },
      ),
    );

    return completer.future;
  }
}

extension CombineCallBack<T> on FullScreenContentCallback<T> {
  FullScreenContentCallback<T> combine(FullScreenContentCallback<T> other) {
    return FullScreenContentCallback<T>(
      onAdFailedToShowFullScreenContent: (ad, err) {
        onAdFailedToShowFullScreenContent?.call(ad, err);
        other.onAdFailedToShowFullScreenContent?.call(ad, err);
      },
      onAdDismissedFullScreenContent: (ad) {
        onAdDismissedFullScreenContent?.call(ad);
        other.onAdDismissedFullScreenContent?.call(ad);
      },
      onAdShowedFullScreenContent: (ad) {
        onAdShowedFullScreenContent?.call(ad);
        other.onAdShowedFullScreenContent?.call(ad);
      },
    );
  }
}
