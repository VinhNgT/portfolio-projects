import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product_purchase.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/donate/domain/donate_product_entry.dart';
import 'package:driving_license/features/donate/presentation/donate_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/extensions/async_snapshot_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BanknoteCard extends HookConsumerWidget {
  const BanknoteCard({super.key, required this.product});
  final IapProduct<DonateProductEntry> product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(banknoteCardControllerProvider);

    final pendingFuture = useState<Future<IapProductPurchaseState>?>(null);
    final snapshot = useFuture(pendingFuture.value);

    useValueChanged<SnapshotState, void>(snapshot.state,
        (previousState, oldResult) {
      if (snapshot.state == SnapshotState.error) {
        _showSnackBar(context, 'Giao dịch không thành công');
      }

      if (previousState == SnapshotState.loading &&
          snapshot.state == SnapshotState.done &&
          snapshot.hasData) {
        if (snapshot.data == IapProductPurchaseState.purchased) {
          _showSnackBar(context, 'Đóng góp thành công, cảm ơn bạn!');
        }

        if (snapshot.data == IapProductPurchaseState.pending) {
          _showSnackBar(context, 'Giao dịch đang chờ xử lý');
        }
      }
    });

    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      borderRadius: kSize_16,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_20,
          vertical: kSize_16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.price,
                  style: context.textTheme.titleLarge,
                ),
                kGap_4,
                Text(
                  _getProductMessage(product.entry),
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.materialScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Image.asset(
              product.entry.imagePath,
              height: 65,
            ),
          ],
        ),
      ),
      onPressed: () {
        pendingFuture.value = controller.buyProduct(product);
      },
    );
  }

  String _getProductMessage(DonateProductEntry entry) => switch (entry) {
        DonateProductEntry.unlockFullAccess10k => 'Đóng góp nhỏ',
        DonateProductEntry.unlockFullAccess20k => 'Đóng góp vừa',
        DonateProductEntry.unlockFullAccess50k => 'Đóng góp kha khá',
        DonateProductEntry.unlockFullAccess100k => 'Đóng góp lớn',
        DonateProductEntry.unlockFullAccess200k => 'Đóng góp rất lớn',
        DonateProductEntry.unlockFullAccess500k => '???',
      };

  void _showSnackBar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }
}
