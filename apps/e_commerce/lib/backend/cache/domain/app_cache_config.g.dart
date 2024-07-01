// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_cache_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppCacheConfigImpl _$$AppCacheConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppCacheConfigImpl(
      cacheDuration: json['cacheDuration'] == null
          ? kDefaultCacheDuration
          : Duration(microseconds: (json['cacheDuration'] as num).toInt()),
      storageDuration: json['storageDuration'] == null
          ? kDefaultCacheStorageDuration
          : Duration(microseconds: (json['storageDuration'] as num).toInt()),
    );

Map<String, dynamic> _$$AppCacheConfigImplToJson(
        _$AppCacheConfigImpl instance) =>
    <String, dynamic>{
      'cacheDuration': instance.cacheDuration.inMicroseconds,
      'storageDuration': instance.storageDuration.inMicroseconds,
    };
