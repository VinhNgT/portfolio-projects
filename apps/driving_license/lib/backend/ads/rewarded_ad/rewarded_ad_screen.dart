import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/backend/ads/rewarded_ad/rewarded_ad_provider.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage<bool>()
class RewardedAdScreen extends HookConsumerWidget {
  const RewardedAdScreen({super.key, required this.adUnit});
  final AdUnit adUnit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ad = ref.watch(rewardedAdFutureProvider(adUnit));
    final rewardedEarned = useRef(false);

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
        child: ad.when(
          skipLoadingOnRefresh: false,
          data: (adValue) => Builder(
            builder: (_) {
              adValue.show(
                onUserEarnedReward: (ad, reward) {
                  rewardedEarned.value = true;
                },
              );

              adValue.fullScreenContentCallback =
                  adValue.fullScreenContentCallback?.combine(
                FullScreenContentCallback(
                  onAdDismissedFullScreenContent: (ad) {
                    context.maybePop<bool>(rewardedEarned.value);
                  },
                ),
              );

              return const SizedBox.shrink();
            },
          ),
          error: (_, __) =>
              const Text('Hiển thị quảng cáo thất bại, vui lòng thử lại sau'),
          loading: () => const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              kGap_20,
              Text('Đang tải quảng cáo'),
            ],
          ),
        ),
      ),
    );
  }
}
