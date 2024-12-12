import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/ui/sliver_divider.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/list_utils.dart';
import 'package:e_commerce/utils/pricing_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class OrderPricingsSliver extends HookWidget {
  const OrderPricingsSliver({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final vndPrice = useMemoized(
      () => PricingUtils.vndPriceFormatter.format(order.totalPrice),
    );

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: kSize_12,
              horizontal: kSize_16,
            ),
            child: Text(
              'Danh sách sản phẩm',
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: kSize_16,
            right: kSize_16,
            bottom: kSize_16,
          ),
          sliver: SliverList.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Gap(kSize_16),
            itemCount: order.items.length,
            itemBuilder: (context, index) {
              return _OrderItemListEntry(orderItem: order.items[index]);
            },
          ),
        ),
        SliverDivider(),
        SliverToBoxAdapter(
          child: _DeliveryOptions(order: order),
        ),
        SliverDivider(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kSize_16,
              vertical: kSize_12,
            ),
            child: DefaultTextStyle(
              style: context.textTheme.titleMedium!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng tiền:'),
                  Text(vndPrice),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OrderItemListEntry extends HookWidget {
  const _OrderItemListEntry({required this.orderItem});
  final OrderItem orderItem;

  final _imageSize = kSize_64;

  @override
  Widget build(BuildContext context) {
    final productVariantsText = useMemoized(
      () => orderItem
          .getProductVariant()
          .map((variant) => variant.name)
          .join(', '),
      [orderItem],
    );

    return IntrinsicHeight(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: orderItem.product.images[0],
                width: _imageSize,
                height: _imageSize,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(kSize_4),
                    ),
                    child: Image(
                      image: imageProvider,
                      width: _imageSize,
                      height: _imageSize,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              Gap(kSize_12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(orderItem.product.title),
                    Text(
                      'Phân loại: $productVariantsText',
                      style: context.textTheme.bodySmall,
                    ),
                    Text(
                      'x${orderItem.quantity}',
                      style: context.textTheme.bodySmall,
                    ),
                  ].separated(Gap(kSize_2)),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              PricingUtils.vndPriceFormatter.format(orderItem.price),
              style: context.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class _DeliveryOptions extends HookWidget {
  const _DeliveryOptions({required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final vndPrice = useMemoized(
      () => PricingUtils.vndPriceFormatter.format(order.shippingFee),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kSize_16,
        vertical: kSize_12,
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: context.textTheme.labelLarge!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phí vận chuyển:'),
                      Text(vndPrice),
                    ],
                  ),
                ),
                Text('Giao hàng nhanh (GHN)'),
                Text('Nhận hàng sau 3 - 5 ngày (26/12 - 28/12)'),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: kSize_4),
                child: Icon(
                  Symbols.arrow_forward_ios,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
