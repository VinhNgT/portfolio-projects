import 'package:auto_route/auto_route.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/home/presentation/donate_card.dart';
import 'package:driving_license/features/home/presentation/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const licenseName = 'Giấy phép lái xe A1';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Symbols.menu, size: PaddingSize.p24),
          onPressed: () {},
        ),
        title: const Text(licenseName),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingSize.p12),
            child: TextButton(onPressed: () {}, child: const Text('Báo lỗi')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: PaddingSize.p16,
          right: PaddingSize.p16,
          top: PaddingSize.p4,
          bottom: PaddingSize.p48,
        ),
        child: Column(
          children: [
            const DonateCard(),
            const Gap(PaddingSize.p20),
            LayoutGrid(
              columnSizes: [1.fr, 1.fr],
              rowSizes: const [auto, auto],
              rowGap: PaddingSize.p12,
              columnGap: PaddingSize.p12,
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
            ),
          ],
        ),
      ),
    );
  }
}
