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
    }
    return _instance!;
  }

  @override
  final String id = 'AppCacheConfig';

  static Duration _$minCacheDuration(AppCacheConfig v) => v.minCacheDuration;
  static const Field<AppCacheConfig, Duration> _f$minCacheDuration =
      Field('minCacheDuration', _$minCacheDuration, opt: true);
  static Duration _$maxCacheDuration(AppCacheConfig v) => v.maxCacheDuration;
  static const Field<AppCacheConfig, Duration> _f$maxCacheDuration =
      Field('maxCacheDuration', _$maxCacheDuration, opt: true);

  @override
  final MappableFields<AppCacheConfig> fields = const {
    #minCacheDuration: _f$minCacheDuration,
    #maxCacheDuration: _f$maxCacheDuration,
  };

  static AppCacheConfig _instantiate(DecodingData data) {
    return AppCacheConfig(
        minCacheDuration: data.dec(_f$minCacheDuration),
        maxCacheDuration: data.dec(_f$maxCacheDuration));
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
  $R call({Duration? minCacheDuration, Duration? maxCacheDuration});
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
          {Object? minCacheDuration = $none,
          Object? maxCacheDuration = $none}) =>
      $apply(FieldCopyWithData({
        if (minCacheDuration != $none) #minCacheDuration: minCacheDuration,
        if (maxCacheDuration != $none) #maxCacheDuration: maxCacheDuration
      }));
  @override
  AppCacheConfig $make(CopyWithData data) => AppCacheConfig(
      minCacheDuration:
          data.get(#minCacheDuration, or: $value.minCacheDuration),
      maxCacheDuration:
          data.get(#maxCacheDuration, or: $value.maxCacheDuration));

  @override
  AppCacheConfigCopyWith<$R2, AppCacheConfig, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppCacheConfigCopyWithImpl($value, $cast, t);
}
