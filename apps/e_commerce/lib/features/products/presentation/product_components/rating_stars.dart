import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    // Example: Round 4.89 to 4.8
    final ratingRoundedDown = (rating * 10).truncate() / 10;

    return Row(
      children: [
        ..._buildStars(context, ratingRoundedDown),
        const Gap(kSize_4),
        Text(
          ratingRoundedDown.toString(),
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }

  List<Widget> _buildStars(BuildContext context, double rating) {
    final stars = <Icon>[];
    for (var i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(
          const Icon(
            Symbols.star,
            color: Colors.amber,
            fill: 1,
            size: 16,
            opticalSize: 48,
          ),
        );
        continue;
      }

      if (i == rating.ceil()) {
        stars.add(
          const Icon(
            Symbols.star_half,
            color: Colors.amber,
            fill: 1,
            size: 16,
            opticalSize: 48,
          ),
        );
        continue;
      }

      stars.add(
        const Icon(
          Symbols.star,
          color: Colors.amber,
          size: 16,
          opticalSize: 48,
        ),
      );
    }
    return stars;
  }
}
