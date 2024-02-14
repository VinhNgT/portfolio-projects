import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DonateCard extends StatelessWidget {
  const DonateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.materialScheme.surfaceContainer,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(
          left: PaddingSize.p20,
          right: PaddingSize.p20,
          top: PaddingSize.p12,
          bottom: PaddingSize.p16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const SvgPicture(
                  AssetBytesLoader(
                    'assets/icons/home_screen/complied/heart.svg.vec',
                  ),
                ),
                const Gap(PaddingSize.p16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đóng góp',
                        style: context.textTheme.titleMedium,
                      ),
                      const Gap(PaddingSize.p2),
                      Text(
                        'Ủng hộ nhà phát triển phần mềm',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(PaddingSize.p16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonal(
                onPressed: () {},
                child: const Text('Mở khoá tất cả tính năng'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
