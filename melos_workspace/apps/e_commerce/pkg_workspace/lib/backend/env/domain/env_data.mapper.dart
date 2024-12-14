// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'env_data.dart';

class EnvDataMapper extends ClassMapperBase<EnvData> {
  EnvDataMapper._();

  static EnvDataMapper? _instance;
  static EnvDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnvDataMapper._());
      AppCacheConfigMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EnvData';

  static AppCacheConfig _$appCacheConfig(EnvData v) => v.appCacheConfig;
  static const Field<EnvData, AppCacheConfig> _f$appCacheConfig =
      Field('appCacheConfig', _$appCacheConfig);
  static Level _$loggerLevel(EnvData v) => v.loggerLevel;
  static const Field<EnvData, Level> _f$loggerLevel =
      Field('loggerLevel', _$loggerLevel);
  static bool _$showDetailedError(EnvData v) => v.showDetailedError;
  static const Field<EnvData, bool> _f$showDetailedError =
      Field('showDetailedError', _$showDetailedError);
  static bool _$rebuildLocalDatabaseOnStartup(EnvData v) =>
      v.rebuildLocalDatabaseOnStartup;
  static const Field<EnvData, bool> _f$rebuildLocalDatabaseOnStartup =
      Field('rebuildLocalDatabaseOnStartup', _$rebuildLocalDatabaseOnStartup);
  static bool _$fillLocalDatabaseWithTestDataOnStartup(EnvData v) =>
      v.fillLocalDatabaseWithTestDataOnStartup;
  static const Field<EnvData, bool> _f$fillLocalDatabaseWithTestDataOnStartup =
      Field('fillLocalDatabaseWithTestDataOnStartup',
          _$fillLocalDatabaseWithTestDataOnStartup);

  @override
  final MappableFields<EnvData> fields = const {
    #appCacheConfig: _f$appCacheConfig,
    #loggerLevel: _f$loggerLevel,
    #showDetailedError: _f$showDetailedError,
    #rebuildLocalDatabaseOnStartup: _f$rebuildLocalDatabaseOnStartup,
    #fillLocalDatabaseWithTestDataOnStartup:
        _f$fillLocalDatabaseWithTestDataOnStartup,
  };

  static EnvData _instantiate(DecodingData data) {
    return EnvData(
        appCacheConfig: data.dec(_f$appCacheConfig),
        loggerLevel: data.dec(_f$loggerLevel),
        showDetailedError: data.dec(_f$showDetailedError),
        rebuildLocalDatabaseOnStartup:
            data.dec(_f$rebuildLocalDatabaseOnStartup),
        fillLocalDatabaseWithTestDataOnStartup:
            data.dec(_f$fillLocalDatabaseWithTestDataOnStartup));
  }

  @override
  final Function instantiate = _instantiate;

  static EnvData fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnvData>(map);
  }

  static EnvData fromJsonString(String json) {
    return ensureInitialized().decodeJson<EnvData>(json);
  }
}

mixin EnvDataMappable {
  String toJsonString() {
    return EnvDataMapper.ensureInitialized()
        .encodeJson<EnvData>(this as EnvData);
  }

  Map<String, dynamic> toJson() {
    return EnvDataMapper.ensureInitialized()
        .encodeMap<EnvData>(this as EnvData);
  }

  EnvDataCopyWith<EnvData, EnvData, EnvData> get copyWith =>
      _EnvDataCopyWithImpl(this as EnvData, $identity, $identity);
  @override
  String toString() {
    return EnvDataMapper.ensureInitialized().stringifyValue(this as EnvData);
  }

  @override
  bool operator ==(Object other) {
    return EnvDataMapper.ensureInitialized()
        .equalsValue(this as EnvData, other);
  }

  @override
  int get hashCode {
    return EnvDataMapper.ensureInitialized().hashValue(this as EnvData);
  }
}

extension EnvDataValueCopy<$R, $Out> on ObjectCopyWith<$R, EnvData, $Out> {
  EnvDataCopyWith<$R, EnvData, $Out> get $asEnvData =>
      $base.as((v, t, t2) => _EnvDataCopyWithImpl(v, t, t2));
}

abstract class EnvDataCopyWith<$R, $In extends EnvData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AppCacheConfigCopyWith<$R, AppCacheConfig, AppCacheConfig> get appCacheConfig;
  $R call(
      {AppCacheConfig? appCacheConfig,
      Level? loggerLevel,
      bool? showDetailedError,
      bool? rebuildLocalDatabaseOnStartup,
      bool? fillLocalDatabaseWithTestDataOnStartup});
  EnvDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EnvDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnvData, $Out>
    implements EnvDataCopyWith<$R, EnvData, $Out> {
  _EnvDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnvData> $mapper =
      EnvDataMapper.ensureInitialized();
  @override
  AppCacheConfigCopyWith<$R, AppCacheConfig, AppCacheConfig>
      get appCacheConfig =>
          $value.appCacheConfig.copyWith.$chain((v) => call(appCacheConfig: v));
  @override
  $R call(
          {AppCacheConfig? appCacheConfig,
          Level? loggerLevel,
          bool? showDetailedError,
          bool? rebuildLocalDatabaseOnStartup,
          bool? fillLocalDatabaseWithTestDataOnStartup}) =>
      $apply(FieldCopyWithData({
        if (appCacheConfig != null) #appCacheConfig: appCacheConfig,
        if (loggerLevel != null) #loggerLevel: loggerLevel,
        if (showDetailedError != null) #showDetailedError: showDetailedError,
        if (rebuildLocalDatabaseOnStartup != null)
          #rebuildLocalDatabaseOnStartup: rebuildLocalDatabaseOnStartup,
        if (fillLocalDatabaseWithTestDataOnStartup != null)
          #fillLocalDatabaseWithTestDataOnStartup:
              fillLocalDatabaseWithTestDataOnStartup
      }));
  @override
  EnvData $make(CopyWithData data) => EnvData(
      appCacheConfig: data.get(#appCacheConfig, or: $value.appCacheConfig),
      loggerLevel: data.get(#loggerLevel, or: $value.loggerLevel),
      showDetailedError:
          data.get(#showDetailedError, or: $value.showDetailedError),
      rebuildLocalDatabaseOnStartup: data.get(#rebuildLocalDatabaseOnStartup,
          or: $value.rebuildLocalDatabaseOnStartup),
      fillLocalDatabaseWithTestDataOnStartup: data.get(
          #fillLocalDatabaseWithTestDataOnStartup,
          or: $value.fillLocalDatabaseWithTestDataOnStartup));

  @override
  EnvDataCopyWith<$R2, EnvData, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _EnvDataCopyWithImpl($value, $cast, t);
}
