import 'dart:async';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'keyboard_visibility_provider.g.dart';

@Riverpod(keepAlive: true)
class KeyboardVisibility extends _$KeyboardVisibility {
  final StreamController<bool> _streamController = StreamController();
  final KeyboardVisibilityController _keyboardVisibilityCtrl =
      KeyboardVisibilityController();

  late StreamSubscription<bool> _keyboardVisibilityChangeSub;

  @override
  Stream<bool> build() {
    _subscribeToKeyboardVisibility();
    ref.onResume(_subscribeToKeyboardVisibility);
    ref.onCancel(_keyboardVisibilityChangeSub.cancel);

    ref.onDispose(_streamController.close);

    return _streamController.stream;
  }

  void _subscribeToKeyboardVisibility() {
    _keyboardVisibilityChangeSub = _keyboardVisibilityCtrl.onChange
        .startWith(_keyboardVisibilityCtrl.isVisible)
        .distinct()
        .listen(
          _streamController.add,
        );
  }
}
