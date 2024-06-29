// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CacheConfigImpl _$$CacheConfigImplFromJson(Map<String, dynamic> json) =>
    _$CacheConfigImpl(
      cacheDuration: json['cacheDuration'] == null
          ? kDefaultCacheDuration
          : Duration(microseconds: (json['cacheDuration'] as num).toInt()),
      storageDuration: json['storageDuration'] == null
          ? kDefaultCacheStorageDuration
          : Duration(microseconds: (json['storageDuration'] as num).toInt()),
    );

Map<String, dynamic> _$$CacheConfigImplToJson(_$CacheConfigImpl instance) =>
    <String, dynamic>{
      'cacheDuration': instance.cacheDuration.inMicroseconds,
      'storageDuration': instance.storageDuration.inMicroseconds,
    };
