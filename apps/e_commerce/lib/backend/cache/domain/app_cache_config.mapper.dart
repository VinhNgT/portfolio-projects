// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_cache_config.dart';

class AppCacheConfigMapper extends ClassMapperBase<AppCacheConfig> {
  AppCacheConfigMapper._();

  static AppCacheConfigMapper? _instance;
  static AppCacheConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppCacheConfigMapper._());
      MapperContainer.globals.useAll([DurationSecondsMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'AppCacheConfig';

  static Duration _$clientCacheDuration(AppCacheConfig v) =>
      v.clientCacheDuration;
  static const Field<AppCacheConfig, Duration> _f$clientCacheDuration =
      Field('clientCacheDuration', _$clientCacheDuration, opt: true);
  static Duration _$networkCacheDuration(AppCacheConfig v) =>
      v.networkCacheDuration;
  static const Field<AppCacheConfig, Duration> _f$networkCacheDuration =
      Field('networkCacheDuration', _$networkCacheDuration, opt: true);

  @override
  final MappableFields<AppCacheConfig> fields = const {
    #clientCacheDuration: _f$clientCacheDuration,
    #networkCacheDuration: _f$networkCacheDuration,
  };

  static AppCacheConfig _instantiate(DecodingData data) {
    return AppCacheConfig(
        clientCacheDuration: data.dec(_f$clientCacheDuration),
        networkCacheDuration: data.dec(_f$networkCacheDuration));
  }

  @override
  final Function instantiate = _instantiate;

  static AppCacheConfig fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppCacheConfig>(map);
  }

  static AppCacheConfig fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppCacheConfig>(json);
  }
}

mixin AppCacheConfigMappable {
  String toJsonString() {
    return AppCacheConfigMapper.ensureInitialized()
        .encodeJson<AppCacheConfig>(this as AppCacheConfig);
  }

  Map<String, dynamic> toJson() {
    return AppCacheConfigMapper.ensureInitialized()
        .encodeMap<AppCacheConfig>(this as AppCacheConfig);
  }

  AppCacheConfigCopyWith<AppCacheConfig, AppCacheConfig, AppCacheConfig>
      get copyWith => _AppCacheConfigCopyWithImpl(
          this as AppCacheConfig, $identity, $identity);
  @override
  String toString() {
    return AppCacheConfigMapper.ensureInitialized()
        .stringifyValue(this as AppCacheConfig);
  }

  @override
  bool operator ==(Object other) {
    return AppCacheConfigMapper.ensureInitialized()
        .equalsValue(this as AppCacheConfig, other);
  }

  @override
  int get hashCode {
    return AppCacheConfigMapper.ensureInitialized()
        .hashValue(this as AppCacheConfig);
  }
}

extension AppCacheConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppCacheConfig, $Out> {
  AppCacheConfigCopyWith<$R, AppCacheConfig, $Out> get $asAppCacheConfig =>
      $base.as((v, t, t2) => _AppCacheConfigCopyWithImpl(v, t, t2));
}

abstract class AppCacheConfigCopyWith<$R, $In extends AppCacheConfig, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Duration? clientCacheDuration, Duration? networkCacheDuration});
  AppCacheConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AppCacheConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppCacheConfig, $Out>
    implements AppCacheConfigCopyWith<$R, AppCacheConfig, $Out> {
  _AppCacheConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppCacheConfig> $mapper =
      AppCacheConfigMapper.ensureInitialized();
  @override
  $R call(
          {Object? clientCacheDuration = $none,
          Object? networkCacheDuration = $none}) =>
      $apply(FieldCopyWithData({
        if (clientCacheDuration != $none)
          #clientCacheDuration: clientCacheDuration,
        if (networkCacheDuration != $none)
          #networkCacheDuration: networkCacheDuration
      }));
  @override
  AppCacheConfig $make(CopyWithData data) => AppCacheConfig(
      clientCacheDuration:
          data.get(#clientCacheDuration, or: $value.clientCacheDuration),
      networkCacheDuration:
          data.get(#networkCacheDuration, or: $value.networkCacheDuration));

  @override
  AppCacheConfigCopyWith<$R2, AppCacheConfig, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppCacheConfigCopyWithImpl($value, $cast, t);
}
