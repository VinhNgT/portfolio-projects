import 'dart:async';

import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:driving_license/logging/logger_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<ConnectivityResult>> connectivityStatus(
  ConnectivityStatusRef ref,
) {
  final controller = StreamController<List<ConnectivityResult>>(
      // onCancel: () => debugPrint('ConnectivityStatus stream canceled'),
      // onListen: () => debugPrint('ConnectivityStatus stream listened'),
      // onPause: () => debugPrint('ConnectivityStatus stream paused'),
      // onResume: () => debugPrint('ConnectivityStatus stream resumed'),
      );
  final connectivity = Connectivity();

  final appLifeCycleSub = AppLifecycleListener(
    onResume: () async {
      controller.add(await connectivity.checkConnectivity());
    },
  );

  final connectivitySub =
      connectivity.onConnectivityChanged.listen(controller.add);

  ref.onDispose(controller.close);
  ref.onDispose(appLifeCycleSub.dispose);
  ref.onDispose(connectivitySub.cancel);

  return controller.stream.distinct((a, b) => a.equals(b));
}

@Riverpod(keepAlive: true)
Future<bool> hasConnectivity(HasConnectivityRef ref) async {
  final logger = ref.watch(loggerProvider);
  final connectivity = await ref.watch(connectivityStatusProvider.future);

  final validConnectivity = [
    ConnectivityResult.wifi,
    ConnectivityResult.ethernet,
    ConnectivityResult.mobile,
    ConnectivityResult.vpn,
    ConnectivityResult.other,
  ];

  // Log status
  ref.listenSelf((previous, next) {
    if (previous?.value == next.value) {
      return;
    }

    if (next.value ?? false) {
      logger.i('Connectivity available');
    } else {
      logger.w('Connectivity is not available');
    }
  });

  // Note that having connectivity does not mean that the app can connect to the
  // internet.
  final hasConnectivity = connectivity.any(validConnectivity.contains);
  return hasConnectivity;
}
