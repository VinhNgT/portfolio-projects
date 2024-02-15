import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/hooks/use_app_bar_scrolled_under_background_color.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/home/presentation/chapter_card.dart';
import 'package:driving_license/features/home/presentation/donate_card.dart';
import 'package:driving_license/features/home/presentation/feature_card.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const licenseName = 'Giấy phép lái xe A1';
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            useAppBarScrolledUnderBackgroundColor(context, scrollController),
        leading: IconButton(
          icon: const Icon(
            Symbols.menu,
            size: SizeConstant.p20,
          ),
          onPressed: () {},
        ),
        title: const Text(licenseName),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeConstant.p12),
            child: TextButton(onPressed: () {}, child: const Text('Báo lỗi')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: const Padding(
          padding: EdgeInsets.only(
            left: SizeConstant.p16,
            right: SizeConstant.p16,
            top: SizeConstant.p4,
            bottom: SizeConstant.p48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DonateCard(),
              Gap(SizeConstant.p20),
              FeatureSelection(),
              Gap(SizeConstant.p32),
              ChapterSelection(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Deprecated, keeping for historical purposes when Flutter team decides to add
/// AppBar color transition animation when MaterialState.scrolledUnder
class AppBarBackgroundColor extends MaterialStateColor {
  final BuildContext context;
  AppBarBackgroundColor(this.context)
      : super(context.materialScheme.surface.value);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.scrolledUnder)) {
      return context.materialScheme.surfaceContainerLow;
    }
    return context.materialScheme.surface;
  }
}

class FeatureSelection extends StatelessWidget {
  const FeatureSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [1.fr, 1.fr],
      rowSizes: const [auto, auto],
      rowGap: SizeConstant.p12,
      columnGap: SizeConstant.p12,
      children: const [
        SizedBox.expand(
          child: FeatureCard(
            title: 'Thi thử',
            subhead: 'Bộ đề được tạo ra ngẫu nhiên',
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Các câu khó',
            subhead: '50 câu hỏi dễ bị nhầm lẫn',
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Đã lưu',
            subhead: 'Những câu hỏi được đánh dấu lưu',
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Đã làm sai',
            subhead: 'Những câu hỏi bạn đã làm sai',
          ),
        ),
      ],
    );
  }
}

class ChapterSelection extends StatelessWidget {
  const ChapterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ôn tập câu hỏi', style: context.textTheme.titleLarge),
        const Gap(SizeConstant.p16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Gap(SizeConstant.p12),
          itemCount: 6,
          itemBuilder: (BuildContext _, int index) => [
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/danger_fire.svg.vec',
              title: 'Câu hỏi điểm liệt',
              subhead: 'Đã hoàn thành 0 / 20',
              onTap: () async => context.pushRoute(
                QuestionRoute(chapterDatabaseKey: 'diemLiet'),
              ),
            ),
            ChapterCard(
              iconAssetPath: 'assets/icons/home_screen/complied/books.svg.vec',
              title: 'Khái niệm và quy tắc',
              subhead: 'Đã hoàn thành 0 / 83 - Sai 5 câu',
              onTap: () async => context.pushRoute(
                QuestionRoute(chapterDatabaseKey: 'khaiNiemVaQuyTac'),
              ),
            ),
            ChapterCard(
              iconAssetPath: 'assets/icons/home_screen/complied/person.svg.vec',
              title: 'Văn hoá và đạo đức',
              subhead: 'Đã hoàn thành 0 / 5',
              onTap: () async => context.pushRoute(
                QuestionRoute(chapterDatabaseKey: 'vanHoaVaDaoDuc'),
              ),
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/steering_wheel.svg.vec',
              title: 'Kỹ thuật lái xe',
              subhead: 'Đã hoàn thành 0 / 12',
              onTap: () async => context
                  .pushRoute(QuestionRoute(chapterDatabaseKey: 'kyThuatLaiXe')),
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/turn_right_sign.svg.vec',
              title: 'Biển báo đường bộ',
              subhead: 'Đã hoàn thành 0 / 65',
              onTap: () async => context.pushRoute(
                QuestionRoute(chapterDatabaseKey: 'bienBaoDuongBo'),
              ),
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/traffic_light.svg.vec',
              title: 'Sa hình',
              subhead: 'Đã hoàn thành 0 / 35',
              onTap: () async => context
                  .pushRoute(QuestionRoute(chapterDatabaseKey: 'saHinh')),
            ),
          ][index],
        ),
      ],
    );
  }
}
