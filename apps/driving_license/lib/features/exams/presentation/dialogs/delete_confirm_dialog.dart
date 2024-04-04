import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';

class DeleteConfirmDialog extends StatelessWidget {
  final String examName;
  const DeleteConfirmDialog({super.key, required this.examName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xác nhận xoá'),
      content: RichText(
        textScaler: context.textScaler,
        text: TextSpan(
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          children: [
            const TextSpan(
              text: 'Bạn có chắc chắn muốn xoá bộ đề này không ?\n\n',
            ),
            TextSpan(
              text: '“$examName”',
              style: context.textTheme.titleMedium!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
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
          child: const Text('Xoá bộ đề'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
