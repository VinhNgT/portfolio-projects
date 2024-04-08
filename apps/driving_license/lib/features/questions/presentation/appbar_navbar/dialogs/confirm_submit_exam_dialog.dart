import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';

class ConfirmSubmitExamDialog extends StatelessWidget {
  const ConfirmSubmitExamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nộp bài thi'),
      content: RichText(
        textScaler: context.textScaler,
        text: TextSpan(
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          children: [
            const TextSpan(
              text: 'Bạn có chắc chắn muốn nộp bài không ?\n',
            ),
            TextSpan(
              text: 'Còn 5 câu hỏi chưa trả lời',
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Huỷ'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text(
            'Nộp bài',
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
