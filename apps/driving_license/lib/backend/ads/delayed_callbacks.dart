import 'dart:async';
import 'dart:ui';

class DelayedCallbacks {
  DelayedCallbacks();
  final Map<Object, Timer> _timers = {};

  void add(Object key, Duration duration, VoidCallback callback) {
    _timers[key]?.cancel();
    _timers[key] = Timer(duration, () {
      _timers.remove(key);
      callback();
    });
  }

  void remove(Object key) {
    _timers[key]?.cancel();
    _timers.remove(key);
  }

  void clearAll() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
  }
}
