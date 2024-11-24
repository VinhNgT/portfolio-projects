// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'env.dart';

class EnvMapper extends ClassMapperBase<Env> {
  EnvMapper._();

  static EnvMapper? _instance;
  static EnvMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnvMapper._());
      AppCacheConfigMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Env';

  static AppCacheConfig _$appCacheConfig(Env v) => v.appCacheConfig;
  static const Field<Env, AppCacheConfig> _f$appCacheConfig =
      Field('appCacheConfig', _$appCacheConfig);
  static Level _$loggerLevel(Env v) => v.loggerLevel;
  static const Field<Env, Level> _f$loggerLevel =
      Field('loggerLevel', _$loggerLevel);
  static bool _$showDetailedError(Env v) => v.showDetailedError;
  static const Field<Env, bool> _f$showDetailedError =
      Field('showDetailedError', _$showDetailedError);

  @override
  final MappableFields<Env> fields = const {
    #appCacheConfig: _f$appCacheConfig,
    #loggerLevel: _f$loggerLevel,
    #showDetailedError: _f$showDetailedError,
  };

  static Env _instantiate(DecodingData data) {
    return Env(
        appCacheConfig: data.dec(_f$appCacheConfig),
        loggerLevel: data.dec(_f$loggerLevel),
        showDetailedError: data.dec(_f$showDetailedError));
  }

  @override
  final Function instantiate = _instantiate;

  static Env fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Env>(map);
  }

  static Env fromJsonString(String json) {
    return ensureInitialized().decodeJson<Env>(json);
  }
}

mixin EnvMappable {
  String toJsonString() {
    return EnvMapper.ensureInitialized().encodeJson<Env>(this as Env);
  }

  Map<String, dynamic> toJson() {
    return EnvMapper.ensureInitialized().encodeMap<Env>(this as Env);
  }

  EnvCopyWith<Env, Env, Env> get copyWith =>
      _EnvCopyWithImpl(this as Env, $identity, $identity);
  @override
  String toString() {
    return EnvMapper.ensureInitialized().stringifyValue(this as Env);
  }

  @override
  bool operator ==(Object other) {
    return EnvMapper.ensureInitialized().equalsValue(this as Env, other);
  }

  @override
  int get hashCode {
    return EnvMapper.ensureInitialized().hashValue(this as Env);
  }
}

extension EnvValueCopy<$R, $Out> on ObjectCopyWith<$R, Env, $Out> {
  EnvCopyWith<$R, Env, $Out> get $asEnv =>
      $base.as((v, t, t2) => _EnvCopyWithImpl(v, t, t2));
}

abstract class EnvCopyWith<$R, $In extends Env, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AppCacheConfigCopyWith<$R, AppCacheConfig, AppCacheConfig> get appCacheConfig;
  $R call(
      {AppCacheConfig? appCacheConfig,
      Level? loggerLevel,
      bool? showDetailedError});
  EnvCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EnvCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Env, $Out>
    implements EnvCopyWith<$R, Env, $Out> {
  _EnvCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Env> $mapper = EnvMapper.ensureInitialized();
  @override
  AppCacheConfigCopyWith<$R, AppCacheConfig, AppCacheConfig>
      get appCacheConfig =>
          $value.appCacheConfig.copyWith.$chain((v) => call(appCacheConfig: v));
  @override
  $R call(
          {AppCacheConfig? appCacheConfig,
          Level? loggerLevel,
          bool? showDetailedError}) =>
      $apply(FieldCopyWithData({
        if (appCacheConfig != null) #appCacheConfig: appCacheConfig,
        if (loggerLevel != null) #loggerLevel: loggerLevel,
        if (showDetailedError != null) #showDetailedError: showDetailedError
      }));
  @override
  Env $make(CopyWithData data) => Env(
      appCacheConfig: data.get(#appCacheConfig, or: $value.appCacheConfig),
      loggerLevel: data.get(#loggerLevel, or: $value.loggerLevel),
      showDetailedError:
          data.get(#showDetailedError, or: $value.showDetailedError));

  @override
  EnvCopyWith<$R2, Env, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _EnvCopyWithImpl($value, $cast, t);
}
