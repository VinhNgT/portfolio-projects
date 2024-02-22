import 'package:driving_license/constants/gap_sizes.dart';
import 'package:flutter/material.dart';

class QuestionImage extends StatelessWidget {
  final String path;
  const QuestionImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kGap_12,
        Image.asset(path),
        kGap_8,
      ],
    );
  }
}
