import 'package:driving_license/backend/remote_config/domain/remote_config_data.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_remote_config.g.dart';

@Riverpod(keepAlive: true)
FutureOr<FirebaseRemoteConfig> firebaseRemoteConfigFuture(
  FirebaseRemoteConfigFutureRef ref,
) async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 30),
      // minimumFetchInterval: const Duration(hours: 24),
    ),
  );

  await remoteConfig.setDefaults(
    const RemoteConfigData(
      gsFeedbackPostLink: '',
      unlockAllFeatures: true,
    ).toJson(),
  );

  return remoteConfig;
}
