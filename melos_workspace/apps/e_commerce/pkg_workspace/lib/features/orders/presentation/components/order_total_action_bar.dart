import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OrderTotalActionBar extends HookWidget {
  const OrderTotalActionBar({
    super.key,
    required this.order,
    required this.actionButtonIcon,
    required this.actionButtonLabel,
    required this.onActionButtonPressed,
  });

  final Order order;
  final Icon actionButtonIcon;
  final String actionButtonLabel;
  final void Function() onActionButtonPressed;

  @override
  Widget build(BuildContext context) {
    final vndPriceFormatter = useMemoized(
      () => order.items[0].product.vndPriceFormatter,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.colorScheme.outlineVariant),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_16,
          vertical: kSize_12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vndPriceFormatter.format(order.itemsPrice),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Phí vận chuyển: '
                  '${vndPriceFormatter.format(order.shippingFee)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            FilledButton.icon(
              icon: actionButtonIcon,
              label: Text(actionButtonLabel),
              onPressed: onActionButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
