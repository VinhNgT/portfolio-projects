import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_card_list_controller.g.dart';

@riverpod
class SelectedAnswerIndex extends _$SelectedAnswerIndex {
  @override
  int? build(int questionPageIndex) {
    return null;
  }

  set value(int? newValue) {
    state = newValue;
  }
}
