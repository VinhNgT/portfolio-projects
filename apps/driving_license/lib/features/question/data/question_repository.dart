import 'package:driving_license/features/question/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_repository.g.dart';

class QuestionRepository {
  Question getQuestion(int index) {
    return _testQuestions[index];
  }

  int getQuestionCount() {
    return _testQuestions.length;
  }
}

@riverpod
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  return QuestionRepository();
}

List<Question> _testQuestions = [
  const Question(
    title:
        '''Khi tránh xe đi ngược chiều, các xe phải nhường đường như thế nào là đúng quy tắc giao thông?''',
    answers: [
      '''Nơi đường hẹp chỉ đủ cho một xe chạy và có chỗ tránh xe thì xe nào ở gần chỗ tránh hơn phải vào vị trí tránh, nhường đường cho xe kia đi''',
      '''Xe xuống dốc phải nhường đường cho xe đang lên dốc; xe nào có chướng ngại vật phía trước phải nhường đường cho xe không có chướng ngại vật đi trước''',
      '''Xe lên dốc phải nhường đường cho xe xuống dốc; xe nào không có chướng ngại vật đi phía trước phải nhường đường cho xe có chướng ngại vật đi trước''',
      '''Cả ý 1 và ý 2''',
    ],
    isDanger: true,
    correctAnswerIndex: 3,
    explanation:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
  ),
  const Question(
    title:
        '''Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường), xe không được lấn làn, không được đè lên vạch?''',
    answers: ['Vạch 1', 'Vạch 2', 'Vạch 3', 'Cả 3 vạch'],
    isDanger: false,
    correctAnswerIndex: 1,
    explanation:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
  ),
  const Question(
    title: 'Các xe đi theo hướng mũi tên, xe nào vi phạm quy tắc giao thông?',
    answers: [
      'Xe khách, xe tải, mô tô',
      'Xe tải, xe con, mô tô',
      'Xe khách, xe con, mô tô',
    ],
    correctAnswerIndex: 0,
    isDanger: false,
    explanation:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
  ),
];
