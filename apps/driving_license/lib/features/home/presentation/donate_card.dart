import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DonateCard extends StatelessWidget {
  const DonateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.materialScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.only(
          left: kSize_20,
          right: kSize_20,
          top: kSize_12,
          bottom: kSize_16,
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
                kGap_16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đóng góp',
                        style: context.textTheme.titleMedium,
                      ),
                      kGap_2,
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
            kGap_16,
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
