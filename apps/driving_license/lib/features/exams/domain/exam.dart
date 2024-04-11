import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/utils/datetime_formatter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

enum ExamAnswersStatus {
  pass,
  passPerfect,
  fail,
  failDanger;

  bool get isPass =>
      this == ExamAnswersStatus.pass || this == ExamAnswersStatus.passPerfect;
  bool get isFail =>
      this == ExamAnswersStatus.fail || this == ExamAnswersStatus.failDanger;
}

@freezed
abstract class Exam with _$Exam {
  const factory Exam({
    @Default('000000000000000000000000000') String examId,
    required String name,
    required DateTime createdUtcTime,
    required List<int> questionDbIndexes,
    required License license,
    @Default(UserAnswersMap.empty) UserAnswersMap userAnswers,
    DateTime? lastAttemptedUtcTime,
  }) = _Exam;
  const Exam._();

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  static final prototype = Exam(
    name: 'Prototype\nPrototype',
    createdUtcTime: DateTime(1999),
    questionDbIndexes: [0],
    license: License.all,
  );

  factory Exam.createNew({
    required License license,
    required List<int> questionDbIndexes,
  }) =>
      Exam(
        name: 'Đề ${DateTimeFormatter.formatLocalTimeDay(DateTime.now())}',
        createdUtcTime: DateTime.now().toUtc(),
        questionDbIndexes: questionDbIndexes,
        license: license,
      );
}

extension ExamOperations on Exam {
  String get licenseType => license.name.toUpperCase();
  Duration get examDuration =>
      Duration(minutes: license.examInfo.examDurationInMinutes);
  int get minimumPassingScore => license.examInfo.minimumPassingScore;
  int get questionsCount => questionDbIndexes.length;

  ExamAnswersStatus get answersStatus {
    final correctAnswers = userAnswers.summary.correctAnswers;
    final wrongAnswers = userAnswers.summary.wrongAnswers;
    final wrongAnswersIsDanger = userAnswers.summary.wrongAnswersIsDanger;

    if (wrongAnswersIsDanger > 0) {
      return ExamAnswersStatus.failDanger;
    }

    if (correctAnswers >= minimumPassingScore) {
      if (wrongAnswers == 0) {
        return ExamAnswersStatus.passPerfect;
      }
      return ExamAnswersStatus.pass;
    }

    return ExamAnswersStatus.fail;
  }
}
