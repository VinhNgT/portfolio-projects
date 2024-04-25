import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/home/domain/chapter_dropdown_selection_data.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class ClearChapterCompletionDialog extends HookConsumerWidget {
  const ClearChapterCompletionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormBuilderState>.new);

    return AlertDialog(
      title: const Text('Xoá tiến độ hoàn thành?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textScaler: context.textScaler,
            text: TextSpan(
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              children: const [
                TextSpan(
                  text: 'Dữ liệu hoàn thành của tất cả các câu hỏi thuộc '
                      'chương được chọn sẽ bị xoá, bao gồm danh sách các câu '
                      'bạn đã làm sai.',
                ),
                TextSpan(
                  text: '\n\n',
                ),
                TextSpan(
                  text: 'Danh sách các câu hỏi đã lưu sẽ không bị ảnh hưởng.',
                ),
              ],
            ),
          ),
          kGap_24,
          ChapterDropdown(formKey: formKey),
        ],
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
            if (formKey.currentState!.saveAndValidate()) {
              final selectedChapter = formKey.currentState!
                  .value['chapter_delete'] as ChapterDropdownSelectionData;

              debugPrint('Selected chapter: $selectedChapter');
            }
          },
        ),
      ],
    );
  }
}

class ChapterDropdown extends HookConsumerWidget {
  final GlobalKey<FormBuilderState>? formKey;
  const ChapterDropdown({super.key, this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: formKey,
      child: ExcludeFocus(
        excluding: true,
        child: FormBuilderDropdown<ChapterDropdownSelectionData>(
          name: 'chapter_delete',
          dropdownColor: context.materialScheme.surfaceContainerHighest,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            hintText: 'Chọn chương',
            suffixIcon: Icon(
              Symbols.expand_more,
            ),
          ),
          icon: const SizedBox.shrink(),
          items: [
            const DropdownMenuItem(
              value: AllChapterSelection('Tất cả các chương'),
              child: Text('Tất cả các chương'),
            ),
            const DropdownMenuItem(
              value: DangerChapterSelection('Các câu hỏi điểm liệt'),
              child: Text('Các câu hỏi điểm liệt'),
            ),
            ...Chapter.values.map(
              (e) => DropdownMenuItem(
                value: ChapterSelection(e),
                child: Text(e.chapterName),
              ),
            ),
          ],
          validator: (value) {
            if (value == null) {
              return 'Vui lòng chọn chương để xoá';
            }
            return null;
          },
        ),
      ),
    );
  }
}
