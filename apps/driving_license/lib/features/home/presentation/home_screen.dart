import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/chapters/data/user_chapter_selection_repository.dart';
import 'package:driving_license/features/home/presentation/chapter_card.dart';
import 'package:driving_license/features/home/presentation/donate_card.dart';
import 'package:driving_license/features/home/presentation/feature_card.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
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
      appBar: CommonAppBar(
        leading: IconButton(
          icon: const Icon(Symbols.menu),
          onPressed: () {},
        ),
        title: const Text(licenseName),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Báo lỗi')),
        ],
        rightPadding: AppBarRightPadding.normalButton,
        scaffoldBodyScrollController: scrollController,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: const Padding(
          padding: EdgeInsets.only(
            left: kSize_16,
            right: kSize_16,
            top: kSize_4,
            bottom: kSize_48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DonateCard(),
              kGap_20,
              FeatureSelection(),
              kGap_32,
              ChapterSelection(),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureSelection extends StatelessWidget {
  const FeatureSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [1.fr, 1.fr],
      rowSizes: const [auto, auto],
      rowGap: kSize_12,
      columnGap: kSize_12,
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

class ChapterSelection extends HookConsumerWidget {
  const ChapterSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ôn tập câu hỏi', style: context.textTheme.titleLarge),
        kGap_16,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => kGap_12,
          itemCount: 7,
          itemBuilder: (BuildContext _, int index) => [
            ChapterCard(
              iconAssetPath: 'assets/icons/home_screen/complied/books.svg.vec',
              title: 'Khái niệm và quy tắc',
              subhead: 'Đã hoàn thành 0 / 83 - Sai 5 câu',
              onTap: () async {
                ref
                    .read(userChapterSelectionRepositoryProvider.notifier)
                    .value = Chapter.khaiNiemVaQuyTac;

                await context.pushRoute(const QuestionRoute());
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/danger_fire.svg.vec',
              title: 'Nghiệp vụ vận tải',
              subhead: 'Đã hoàn thành 0 / 20',
              onTap: () async {
                ref
                    .read(userChapterSelectionRepositoryProvider.notifier)
                    .value = Chapter.nghiepVuVanTai;

                await context.pushRoute(const QuestionRoute());
              },
            ),
            ChapterCard(
              iconAssetPath: 'assets/icons/home_screen/complied/person.svg.vec',
              title: 'Văn hoá và đạo đức',
              subhead: 'Đã hoàn thành 0 / 5',
              onTap: () async {
                ref
                    .read(userChapterSelectionRepositoryProvider.notifier)
                    .value = Chapter.vanHoaVaDaoDuc;

                await context.pushRoute(const QuestionRoute());
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/steering_wheel.svg.vec',
              title: 'Kỹ thuật lái xe',
              subhead: 'Đã hoàn thành 0 / 12',
              onTap: () async {
                ref
                    .read(userChapterSelectionRepositoryProvider.notifier)
                    .value = Chapter.kyThuatLaiXe;

                await context.pushRoute(const QuestionRoute());
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/danger_fire.svg.vec',
              title: 'Cấu taọ và sửa chữa',
              subhead: 'Đã hoàn thành 0 / 20',
              onTap: () async {
                ref
                    .read(userChapterSelectionRepositoryProvider.notifier)
                    .value = Chapter.cauTaoVaSuaChua;

                await context.pushRoute(const QuestionRoute());
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/turn_right_sign.svg.vec',
              title: 'Biển báo đường bộ',
              subhead: 'Đã hoàn thành 0 / 65',
              onTap: () async {
                ref
                    .read(userChapterSelectionRepositoryProvider.notifier)
                    .value = Chapter.bienBaoDuongBo;

                await context.pushRoute(const QuestionRoute());
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/traffic_light.svg.vec',
              title: 'Sa hình',
              subhead: 'Đã hoàn thành 0 / 35',
              onTap: () async {
                ref
                    .read(userChapterSelectionRepositoryProvider.notifier)
                    .value = Chapter.saHinhVaTinhHuong;

                await context.pushRoute(const QuestionRoute());
              },
            ),
          ][index],
        ),
      ],
    );
  }
}
