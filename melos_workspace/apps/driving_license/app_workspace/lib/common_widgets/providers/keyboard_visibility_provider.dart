import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyboard_visibility_provider.g.dart';

@riverpod
bool keyboardVisibility(KeyboardVisibilityRef ref) {
  final keyboardVisibilityController = KeyboardVisibilityController();

  final keyboardSubscription =
      keyboardVisibilityController.onChange.listen((isVisible) {
    ref.state = isVisible;
  });

  ref.onDispose(keyboardSubscription.cancel);

  return keyboardVisibilityController.isVisible;
}
