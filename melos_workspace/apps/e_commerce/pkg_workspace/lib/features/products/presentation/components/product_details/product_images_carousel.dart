import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/physics/fast_page_view_scroll_physics.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/constants/golden_ratios.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductImagesCarousel extends HookConsumerWidget {
  const ProductImagesCarousel({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentImageIndex = useState(0);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        FlutterCarousel.builder(
          options: FlutterCarouselOptions(
            physics: const FastPageViewScrollPhysics(),
            viewportFraction: 1.0,
            showIndicator: false,
            onPageChanged: (index, reason) => currentImageIndex.value = index,
          ),
          itemCount: product.images.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSize_12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSize_20),
                  color: context.colorScheme.surfaceContainerHighest
                      .withOpacity(kGoldenRatioDivide_1),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: product.images[index],
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: kSize_8,
            bottom: kSize_8,
            left: kSize_8,
            right: kSize_20,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(kSize_12),
              border: Border.all(
                color: context.colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSize_8,
                vertical: kSize_2,
              ),
              child: Text(
                '${currentImageIndex.value + 1}/${product.images.length}',
                style: context.theme.textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
