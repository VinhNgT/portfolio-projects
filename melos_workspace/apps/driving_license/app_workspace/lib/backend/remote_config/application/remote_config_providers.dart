import 'dart:async';

import 'package:driving_license/backend/remote_config/domain/remote_config_data.dart';
import 'package:driving_license/backend/remote_config/firebase_remote_config.dart';
import 'package:driving_license/exceptions/app_exception.dart';
import 'package:driving_license/logging/logger_provider.dart';
import 'package:driving_license/utils/stringify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_providers.g.dart';

@Riverpod(keepAlive: true)
class RemoteConfigDataFuture extends _$RemoteConfigDataFuture {
  @override
  FutureOr<RemoteConfigData> build() async {
    final remoteConfig =
        ref.watch(firebaseRemoteConfigFutureProvider).requireValue;
    final logger = ref.watch(loggerProvider);

    try {
      await remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e, st) {
      unawaited(Future.error(const RemoteConfigFetchFailedException(), st));
    }

    ref.listen(_remoteConfigUpdateStreamProvider, (_, __) async {
      final oldValue = remoteConfig.getAll();
      await remoteConfig.activate();
      final newValue = remoteConfig.getAll();

      if (!_isSameConfig(oldValue, newValue)) {
        ref.invalidateSelf();
        debugPrint('New remote config available (real-time)');
      }
    });

    final remoteConfigData = RemoteConfigData(
      gsFeedbackPostLink: remoteConfig.getString('gs_feedback_post_link'),
      unlockAllFeatures: remoteConfig.getBool('unlock_all_features'),
    );

    debugPrint('Remote config fetched');
    logger.i(stringify(remoteConfigData.toJson()));

    return remoteConfigData;
  }

  bool _isSameConfig(
    Map<String, RemoteConfigValue> valueA,
    Map<String, RemoteConfigValue> valueB,
  ) {
    if (valueA.length != valueB.length) {
      return false;
    }

    for (final key in valueA.keys) {
      if (valueA[key]?.asString() != valueB[key]?.asString()) {
        return false;
      }
    }

    return true;
  }
}

@Riverpod(keepAlive: true)
Stream<RemoteConfigUpdate> _remoteConfigUpdateStream(
  _RemoteConfigUpdateStreamRef ref,
) {
  final remoteConfig =
      ref.watch(firebaseRemoteConfigFutureProvider).requireValue;
  return remoteConfig.onConfigUpdated;
}
