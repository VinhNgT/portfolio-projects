import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ExamsListEmpty extends StatelessWidget {
  const ExamsListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Danh sách trống', style: context.textTheme.titleLarge),
          kGap_4,
          Text(
            'Nhấn nút dưới đây để tạo bộ đề mới',
            style: context.textTheme.bodyLarge!
                .copyWith(color: context.materialScheme.onSurfaceVariant),
          ),
          kGap_16,
          FloatingActionButton.extended(
            icon: const Icon(Symbols.add),
            label: const Text('Tạo bộ đề mới'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
