import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/features/question/domain/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class QuestionScreen extends HookConsumerWidget {
  final int chapterDatabaseKey;
  const QuestionScreen({super.key, required this.chapterDatabaseKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return Scaffold(
      appBar: CommonAppBar(
        title: Text('Câu hỏi ${chapterDatabaseKey + 1}'),
        actions: [
          IconButton(
            icon: const Icon(Symbols.bookmark),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Symbols.restart_alt),
            onPressed: () {},
          ),
        ],
        scaffoldBodyScrollController: scrollController,
      ),
      body: const Text('Question Screen'),
    );
  }
}

List<Question> questions = [
  const Question(
    questionId: 1,
    question:
        '''Khi tránh xe đi ngược chiều, các xe phải nhường đường như thế nào là đúng quy tắc giao thông?''',
    answers: [
      '''Nơi đường hẹp chỉ đủ cho một xe chạy và có chỗ tránh xe thì xe nào ở gần chỗ tránh hơn phải vào vị trí tránh, nhường đường cho xe kia đi''',
      '''Xe xuống dốc phải nhường đường cho xe đang lên dốc; xe nào có chướng ngại vật phía trước phải nhường đường cho xe không có chướng ngại vật đi trước''',
      '''Xe lên dốc phải nhường đường cho xe xuống dốc; xe nào không có chướng ngại vật đi phía trước phải nhường đường cho xe có chướng ngại vật đi trước''',
    ],
    isDanger: true,
    tip:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
  ),
  const Question(
    questionId: 2,
    question:
        '''Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường), xe không được lấn làn, không được đè lên vạch?''',
    answers: ['Vạch 1', 'Vạch 2', 'Vạch 3', 'Cả 3 vạch'],
    isDanger: false,
    tip:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
  ),
  const Question(
    questionId: 3,
    question:
        'Các xe đi theo hướng mũi tên, xe nào vi phạm quy tắc giao thông?',
    answers: [
      'Xe khách, xe tải, mô tô',
      'Xe tải, xe con, mô tô',
      'Xe khách, xe con, mô tô',
    ],
    isDanger: false,
    tip:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
  ),
];
