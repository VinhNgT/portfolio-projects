// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_cache_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppCacheConfigImpl _$$AppCacheConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppCacheConfigImpl(
      minCacheDuration: json['minCacheDuration'] == null
          ? kDefaultMinCacheDuration
          : const DurationSecondsConverter()
              .fromJson((json['minCacheDuration'] as num).toInt()),
      maxCacheDuration: json['maxCacheDuration'] == null
          ? kDefaultMaxCacheDuration
          : const DurationSecondsConverter()
              .fromJson((json['maxCacheDuration'] as num).toInt()),
    );

Map<String, dynamic> _$$AppCacheConfigImplToJson(
        _$AppCacheConfigImpl instance) =>
    <String, dynamic>{
      'minCacheDuration':
          const DurationSecondsConverter().toJson(instance.minCacheDuration),
      'maxCacheDuration':
          const DurationSecondsConverter().toJson(instance.maxCacheDuration),
    };
