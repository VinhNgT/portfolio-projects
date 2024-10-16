import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'env_data.freezed.dart';
part 'env_data.g.dart';

@freezed
class EnvData with _$EnvData {
  const factory EnvData({
    required Level loggerLevel,
    required bool showDetailedError,
  }) = _EnvData;

  factory EnvData.fromJson(Map<String, dynamic> json) =>
      _$EnvDataFromJson(json);

  factory EnvData.fromEnviroment() {
    return EnvData(
      loggerLevel: Level.values.byName(
        const String.fromEnvironment('LOG_LEVEL', defaultValue: 'debug'),
      ),
      showDetailedError:
          const bool.fromEnvironment('SHOW_DETAILED_ERROR', defaultValue: true),
    );
  }
}
