// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductMetaImpl _$$ProductMetaImplFromJson(Map<String, dynamic> json) =>
    _$ProductMetaImpl(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      barcode: json['barcode'] as String?,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$$ProductMetaImplToJson(_$ProductMetaImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'barcode': instance.barcode,
      'qrCode': instance.qrCode,
    };
