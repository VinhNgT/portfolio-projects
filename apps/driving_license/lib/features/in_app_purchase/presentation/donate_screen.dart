import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/in_app_purchase/iap_entry.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/in_app_purchase/presentation/bank_note_card.dart';
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
            bottom: kSize_48,
            left: kSize_16,
            right: kSize_16,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Column(
                children: [
                  const SvgPicture(
                    AssetBytesLoader('assets/icons/compiled/donate.svg.vec'),
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
                  kGap_32,
                  const BankNotesList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BankNotesList extends StatelessWidget {
  const BankNotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (final entry in IapProductEntry.values)
          BankNoteCard(productEntry: entry),
      ].separated(kGap_16),
    );
  }
}
