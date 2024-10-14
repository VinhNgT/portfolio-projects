import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/in_app_purchase/data/iap_providers.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/donate/presentation/banknote_card.dart';
import 'package:driving_license/features/donate/presentation/donate_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/list_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class DonateScreen extends HookConsumerWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    ref.listen(
      isUserDonatedProvider,
      (previous, next) {
        if (previous?.value == false && next.value == true) {
          context.maybePop();
        }
      },
    );

    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('Đóng góp'),
        scaffoldBodyScrollController: scrollController,
      ),
      body: WidgetDeadzone(
        deadzone: EdgeInsets.only(
          bottom: context.systemGestureInsets.bottom,
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.only(
            top: kSize_4,
            bottom: kSize_24,
            left: kSize_16,
            right: kSize_16,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Column(
                children: [
                  const SvgPicture(
                    AssetBytesLoader(
                      'assets/icons/donation/_compiled/donate.svg.vec',
                    ),
                    height: 96,
                  ),
                  kGap_24,
                  Text(
                    'Cảm ơn bạn đã sử dụng ứng dụng',
                    style: context.textTheme.titleMedium,
                  ),
                  kGap_20,
                  const Text('''
Ứng dụng hiện tại chỉ hiển thị quảng cáo ở một số nơi nhất định, không hiển thị bất ngờ làm lãng phí thời gian của bạn, gây mất tập trung trong quá trình học.

Bằng việc thực hiện đóng góp, bạn sẽ giúp nhà phát triển không phải phụ thuộc vào nguồn thu từ quảng cáo, nâng cao trải nghiệm cho tất cả mọi người.

Toàn bộ quảng cáo trên ứng dụng sẽ được loại bỏ sau khi giao dịch thành công. Lưu ý bạn chỉ có thể thực hiện đóng góp 1 lần.'''),
                  // kGap_32,
                  kGap_24,
                  const Divider(),
                  kGap_24,
                  const BanknotesList(),
                  kGap_8,
                  TextButton.icon(
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        context.materialScheme.error,
                      ),
                    ),
                    icon: const Icon(Icons.settings_backup_restore),
                    label: const Text(
                      'Khôi phục thanh toán',
                    ),
                    onPressed: () => ref.read(iapProvider).restorePurchases(),
                  ),
                  kGap_8,
                  Text(
                    'Hãy nhấn \'Khôi phục thanh toán\' nếu bạn đã đóng góp '
                    'thành công mà ứng dụng chưa loại bỏ quảng cáo hoặc bạn '
                    'chuyển sang thiết bị mới.',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.materialScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BanknotesList extends HookConsumerWidget {
  const BanknotesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iapProductsList = ref.watch(donateProductListFutureProvider);

    return AsyncValueWidget(
      value: iapProductsList,
      builder: (iapProductsListValue) => Column(
        children: <Widget>[
          for (final product in iapProductsListValue)
            BanknoteCard(product: product),
        ].separated(kGap_16),
      ),
    );
  }
}
