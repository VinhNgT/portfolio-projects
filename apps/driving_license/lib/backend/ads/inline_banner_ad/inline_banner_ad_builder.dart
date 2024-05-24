import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/backend/ads/inline_banner_ad/inline_banner_ad_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InlineBannerAdBuilder extends HookConsumerWidget {
  InlineBannerAdBuilder({
    super.key,
    required this.adUnit,
    required this.builder,
  }) : assert(adUnit.type == BannerAd);

  final AdUnit adUnit;
  final Widget Function(Widget adWidget) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer(
          builder: (context, ref, child) {
            final adMobBannerAd = ref
                .watch(
                  inlineBannerAdStreamProvider(
                    adUnit,
                    InLineBannerAdConfig(width: constraints.maxWidth),
                  ),
                )
                .valueOrNull;

            if (adMobBannerAd == null) {
              return const SizedBox.shrink();
            }

            return builder(_AdViewWidget(adMobBannerAd));
          },
        );
      },
    );
  }
}

class _AdViewWidget extends StatelessWidget {
  const _AdViewWidget(this.platformBannerAd);
  final PlatformBannerAd platformBannerAd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: platformBannerAd.platformAdSize.width.toDouble(),
      height: platformBannerAd.platformAdSize.height.toDouble(),
      child: AdWidget(ad: platformBannerAd.bannerAd),
    );
  }
}
