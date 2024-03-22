import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeProviderRefX on AutoDisposeProviderRef {
  /// Keeps the [provider] alive by listening to its changes.
  ///
  /// The [provider] is a [ProviderListenable] object that notifies its
  /// listeners its value changes. This function adds a listener to the
  /// [provider] that does nothing when the value changes. This effectively
  /// keeps the [provider] alive and prevents it from being garbage collected.
  void keepProviderAlive<T>(ProviderListenable<T> provider) {
    listen(provider, (previous, next) {});
  }
}

extension WidgetRefX on WidgetRef {
  /// Keeps the [provider] alive by listening to its changes.
  ///
  /// The [provider] is a [ProviderListenable] object that notifies its
  /// listeners its value changes. This function adds a listener to the
  /// [provider] that does nothing when the value changes. This effectively
  /// keeps the [provider] alive and prevents it from being garbage collected.
  void keepProviderAlive<T>(ProviderListenable<T> provider) {
    listen(provider, (previous, next) {});
  }

  /// A hook to watch and retrieve the value of an [AsyncValue] from a
  /// [ProviderListenable].
  ///
  /// The [initialData] parameter is the initial value to be used before any
  /// [AsyncValue] is emitted.
  ///
  T useWatchAsyncValue<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    required T initialData,
  }) {
    final currentState = useRef<T>(initialData);

    return watch(
      provider.select((value) {
        return value.map(
          data: (asyncData) {
            currentState.value = asyncData.value;
            return asyncData;
          },
          error: (asyncError) => asyncError,
          loading: (asyncLoading) => AsyncData(currentState.value),
        );
      }),
    ).requireValue;
  }
}
