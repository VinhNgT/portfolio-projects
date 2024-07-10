import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

class BenefitsCard extends StatelessWidget {
  const BenefitsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kSize_12,
        horizontal: kSize_16,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(kSize_12)),
      ),
      child: const Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Symbols.undo,
                size: 20,
              ),
              Gap(kSize_12),
              Expanded(
                child: Text('Trả hàng hoàn tiền miễn phí trong vòng 30 ngày'),
              ),
            ],
          ),
          Gap(kSize_12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Symbols.redeem,
                size: 20,
              ),
              Gap(kSize_12),
              Expanded(
                child: Text(
                  'Tặng mã giảm giá shop 10% (tối đa 60k) sau khi hoàn thành '
                  'đơn hàng đầu tiên',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
