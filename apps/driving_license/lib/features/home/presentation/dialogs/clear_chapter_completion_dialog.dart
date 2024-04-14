import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';

class ClearChapterCompletionDialog extends StatelessWidget {
  const ClearChapterCompletionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xoá tiến độ hoàn thành?'),
      content: RichText(
        textScaler: context.textScaler,
        text: TextSpan(
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          children: const [
            TextSpan(
              text: 'Dữ liệu hoàn thành của tất cả các câu hỏi sẽ bị xoá, '
                  'bao gồm danh sách các câu bạn đã làm sai',
            ),
            TextSpan(
              text: '\n\n',
            ),
            TextSpan(
              text: 'Danh sách các câu hỏi đã lưu sẽ không bị ảnh hưởng',
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
          child: Text(
            'Xoá tiến độ',
            style: TextStyle(color: context.materialScheme.error),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
