import 'dart:async';

import 'package:driving_license/logging/logger_provider.dart';
import 'package:driving_license/utils/stringify.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_remote_config.g.dart';

@Riverpod(keepAlive: true)
FirebaseRemoteConfig firebaseRemoteConfig(
  FirebaseRemoteConfigRef ref,
) {
  final remoteConfig = FirebaseRemoteConfig.instance;
  final logger = ref.watch(loggerProvider);

  unawaited(
    Future(() async {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 24),
        ),
      );

      await remoteConfig.fetchAndActivate();
      ref.notifyListeners();
    }),
  );

  remoteConfig.onConfigUpdated.listen((event) async {
    await remoteConfig.activate();
    ref.notifyListeners();

    logger.w('Remote config real-time updated \n'
        '${stringify(event.updatedKeys)}');
  });

  return remoteConfig;
}
