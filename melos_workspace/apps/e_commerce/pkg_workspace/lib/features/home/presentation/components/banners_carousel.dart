import 'package:e_commerce/common/physics/fast_page_view_scroll_physics.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/constants/golden_ratios.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BannersCarousel extends HookConsumerWidget {
  const BannersCarousel({super.key});

  static const _indicatorRadius = kSize_4;
  static const _indicatorMargin = kSize_6;
  static const _bannerHeight = 112.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) => FlutterCarousel.builder(
        itemCount: 12,
        options: FlutterCarouselOptions(
          enableInfiniteScroll: true,
          physics: const FastPageViewScrollPhysics(),
          slideIndicator: CircularSlideIndicator(
            slideIndicatorOptions: SlideIndicatorOptions(
              currentIndicatorColor: context.theme.colorScheme.onSurfaceVariant,
              indicatorBackgroundColor: context
                  .theme.colorScheme.onSurfaceVariant
                  .withOpacity(kGoldenRatioDivide_3),
              indicatorRadius: _indicatorRadius,
              itemSpacing: kSize_12,
            ),
          ),
          viewportFraction: 1.0,
          showIndicator: true,
          floatingIndicator: false,
          indicatorMargin: _indicatorMargin,
          height: _bannerHeight + _indicatorRadius + _indicatorMargin,
        ),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: kSize_12),
            width: constraints.maxWidth,
            child: _Banner(index: itemIndex + 1),
          );
        },
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSize_8),
        image: DecorationImage(
          image: AssetImage('assets/shopee_banners/banner_$index.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
