import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, required this.errorMessage});

  /// We should use defaultMessage where possible for production environment
  /// because showing a detailed error to the user may not be a good idea.
  const AppErrorWidget.defaultMessage({super.key})
      : errorMessage = 'Lỗi không thể hiển thị nội dung';

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSize_16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgPicture(
                AssetBytesLoader(
                  'assets/icons/compiled/view_error.svg.vec',
                ),
              ),
              kGap_24,
              Text(
                errorMessage,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
