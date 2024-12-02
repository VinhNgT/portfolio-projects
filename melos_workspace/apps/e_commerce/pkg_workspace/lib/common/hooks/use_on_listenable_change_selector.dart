import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useOnListenableChangeSelector<T, V>(
  ValueListenable<T> listenable,
  V Function(T value) selector,
  VoidCallback listener,
) {
  final currentValue = useRef<V?>(selector(listenable.value));

  useOnListenableChange(
    listenable,
    () {
      final newValue = selector(listenable.value);

      if (newValue != currentValue.value) {
        currentValue.value = newValue;
        listener();
      }
    },
  );
}
