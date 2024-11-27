import 'package:hooks_riverpod/hooks_riverpod.dart';

extension RiverpodWidgetRefHelpers on WidgetRef {
  /// Retrieve the value of the provider's future and prevent it from being
  /// disposed until the future completes.
  ///
  /// A notable use case is when you need the value of a provider that has
  /// implemented Dio's CancelToken. Without keeping the provider alive, the
  /// request will be cancelled and the future will return an error.
  Future<T> awaitAsyncProvider<T>(ProviderBase<AsyncValue<T>> provider) async {
    final sub = listenManual(provider, (_, __) {});

    try {
      final T result = await switch (provider) {
        FutureProvider<T>() => read(provider.future),
        AutoDisposeFutureProvider<T>() => read(provider.future),
        StreamProvider<T>() => read(provider.future),
        AutoDisposeStreamProvider<T>() => read(provider.future),

        //
        _ => throw ArgumentError.value(
            provider,
            'provider',
            'Unsupported provider type',
          ),
      };

      return result;
    } catch (e) {
      rethrow;
    } finally {
      sub.close();
    }
  }
}
