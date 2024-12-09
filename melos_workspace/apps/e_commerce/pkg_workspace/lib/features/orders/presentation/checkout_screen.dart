import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/ui/sliver_divider.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/presentation/components/order_products_list.dart';
import 'package:e_commerce/features/orders/presentation/components/order_total_action_bar.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/pricing_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tổng quan đơn hàng'),
        scrolledUnderElevation: 1,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSize_16,
              ),
              child: _ReceiveAddressCard(receiveAddress: order.receiveAddress),
            ),
          ),
          SliverGap(kSize_16),
          SliverDivider(size: kSize_8),
          OrderPricingsSliver(order: order),
          SliverDivider(size: kSize_8),
          SliverGap(kSize_16),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSize_16,
              ),
              child: _PaymentMethodCard(),
            ),
          ),
          SliverGap(kSize_8),
          // SliverDivider(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: kSize_12,
                bottom: kSize_48,
                left: kSize_16,
                right: kSize_16,
              ),
              child: _FinalTotal(order: order),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: OrderTotalActionBar(
          order: order,
          actionButtonIcon: const Icon(Symbols.check_circle_outline),
          actionButtonLabel: 'Thanh toán',
          onActionButtonPressed: () {},
        ),
      ),
    );
  }
}

class _ReceiveAddressCard extends StatelessWidget {
  const _ReceiveAddressCard({required this.receiveAddress});
  final String receiveAddress;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.only(
          left: kSize_16,
          right: kSize_4,
          top: kSize_12,
          bottom: kSize_12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Địa chỉ nhận hàng',
                    style: context.textTheme.titleSmall,
                  ),
                  Gap(kSize_2),
                  Text(receiveAddress),
                ],
              ),
            ),
            Gap(kSize_8),
            SizedBox.square(
              dimension: kSize_48,
              child: Icon(
                Symbols.arrow_forward_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard();

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.only(
          left: kSize_16,
          right: kSize_4,
          top: kSize_12,
          bottom: kSize_12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phương thức thanh toán',
                    style: context.textTheme.titleSmall,
                  ),
                  Gap(kSize_2),
                  Text('Thanh toán khi nhận hàng'),
                ],
              ),
            ),
            Gap(kSize_8),
            SizedBox.square(
              dimension: kSize_48,
              child: Icon(
                Symbols.arrow_forward_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FinalTotal extends HookWidget {
  const _FinalTotal({required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final pricingFormatter = PricingUtils.vndPriceFormatter;

    return Column(
      children: <Widget>[
        DefaultTextStyle(
          style: context.textTheme.bodySmall!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền hàng:'),
              Text(pricingFormatter.format(order.itemsPrice)),
            ],
          ),
        ),
        Gap(kSize_4),
        DefaultTextStyle(
          style: context.textTheme.bodySmall!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng phí vận chuyển:'),
              Text(pricingFormatter.format(order.shippingFee)),
            ],
          ),
        ),
        Gap(kSize_8),
        DefaultTextStyle(
          style: context.textTheme.titleMedium!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng thanh toán:'),
              Text(pricingFormatter.format(order.totalPrice)),
            ],
          ),
        ),
      ],
    );
  }
}
