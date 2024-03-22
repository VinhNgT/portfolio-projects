import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefX on WidgetRef {
  /// Keeps the [provider] alive by listening to its changes.
  ///
  /// The [provider] is a [ProviderListenable] object that notifies its
  /// listeners its value changes. This function adds a listener to the
  /// [provider] that does nothing when the value changes. This effectively
  /// keeps the [provider] alive and prevents it from being garbage collected.
  void keepAlive<T>(ProviderListenable<T> provider) {
    listen(provider, (previous, next) {});
  }
}
