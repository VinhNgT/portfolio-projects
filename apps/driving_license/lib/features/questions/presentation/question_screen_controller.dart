import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_screen_controller.g.dart';

// This provider is used to keep track of the index of the page in the
// middle of the screen.
// It should change when the user scrolled halfway through a new page
@riverpod
class CurrentPageIndex extends _$CurrentPageIndex {
  @override
  int build() {
    return 0;
  }

  set value(int newValue) {
    state = newValue;
  }
}
