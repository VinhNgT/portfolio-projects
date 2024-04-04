import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RenameDialog extends HookConsumerWidget {
  final String examName;
  const RenameDialog({super.key, required this.examName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: examName);

    return AlertDialog(
      title: const Text('Đổi tên bộ đề'),
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: 'Nhập tên mới cho bộ đề',
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Huỷ'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Xác nhận'),
          onPressed: () {
            Navigator.of(context).pop(textController.text);
          },
        ),
      ],
    );
  }
}
