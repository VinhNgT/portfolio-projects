import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/constants/golden_ratios.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_review.dart';
import 'package:e_commerce/features/products/presentation/components/rating_stars.dart';
import 'package:e_commerce/theme/theme_utils.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProductReviewsWidget extends HookConsumerWidget {
  const ProductReviewsWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSize_16),
          child: Text(
            'Đánh giá',
            style: context.textTheme.titleLarge,
          ),
        ),
        const Gap(kSize_4),
        Padding(
          padding: const EdgeInsets.only(left: kSize_16, right: kSize_2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ReviewsOverview(product),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Symbols.arrow_forward_ios),
                  label: Text(
                    'Xem tất cả',
                    style: context.textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(kSize_12),
        _ReviewPictures(product),
        const Gap(kSize_12),
        _ReviewContentsList(product.reviews),
      ],
    );
  }
}

class _ReviewsOverview extends StatelessWidget {
  const _ReviewsOverview(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              product.rating.toString(),
              style: context.textTheme.headlineMedium,
            ),
            const Gap(kSize_6),
            Padding(
              padding: const EdgeInsets.only(bottom: kSize_4),
              child: RatingStars(
                rating: product.rating,
                starSize: kSize_20,
              ),
            ),
          ],
        ),
        Text(
          '${product.reviews.length} lượt đánh giá',
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _ReviewPictures extends HookConsumerWidget {
  const _ReviewPictures(this.product);

  final Product product;
  final int _mockReviewImagesCount = 10;
  final double imageSize = 100;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mockReviewImages = useMemoized(
      () => List.generate(
        _mockReviewImagesCount,
        (index) => product.images.elementAt(index % product.images.length),
      ),
      [_mockReviewImagesCount],
    );

    return SizedBox(
      height: imageSize,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: kSize_16, right: kSize_4),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const Gap(kSize_8),
        itemCount: mockReviewImages.length + 1,
        itemBuilder: (context, index) {
          if (index == mockReviewImages.length) {
            return SizedBox.square(
              dimension: kSize_48,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Symbols.arrow_forward_ios,
                  size: kSize_24,
                ),
              ),
            );
          }

          final image = mockReviewImages[index];

          return Container(
            width: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSize_4),
              color: context.colorScheme.surfaceContainerHighest
                  .withValues(alpha: kGoldenRatioDivide_1),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ReviewContentsList extends StatelessWidget {
  const _ReviewContentsList(this.reviews);

  final List<ProductReview> reviews;
  final double reviewCardWidth = 300;
  final double reviewCardHeight = 150;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: reviewCardHeight,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: kSize_16, right: kSize_4),
        separatorBuilder: (context, index) => const Gap(kSize_8),
        scrollDirection: Axis.horizontal,
        itemCount: reviews.length + 1,
        itemBuilder: (context, index) {
          if (index == reviews.length) {
            return SizedBox.square(
              dimension: kSize_48,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Symbols.arrow_forward_ios,
                  size: kSize_24,
                ),
              ),
            );
          }

          return SizedBox(
            width: reviewCardWidth,
            child: _ReviewContentCard(reviews[index]),
          );
        },
      ),
    );
  }
}

class _ReviewContentCard extends StatelessWidget {
  const _ReviewContentCard(this.review);
  final ProductReview review;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colorScheme.outlineVariant),
        borderRadius: BorderRadius.all(
          Radius.circular(ThemeUtils.getCardBorderRadius(context)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kSize_12,
          horizontal: kSize_16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingStars(rating: review.rating.toDouble()),
                Text(
                  DateFormatter.format(DateTime.parse(review.date)),
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            const Gap(kSize_2),
            Text(
              review.reviewerName,
              style: context.textTheme.labelLarge,
            ),
            const Gap(kSize_2),
            Text(
              'Kích thước: 16 - Màu sắc: Đen',
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap(kSize_8),
            Text(
              review.comment,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
