// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dimensions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDimensionsImpl _$$ProductDimensionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDimensionsImpl(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductDimensionsImplToJson(
        _$ProductDimensionsImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };
