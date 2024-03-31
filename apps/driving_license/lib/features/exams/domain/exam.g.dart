// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamImpl _$$ExamImplFromJson(Map<String, dynamic> json) => _$ExamImpl(
      name: json['name'] as String,
      createdTime: DateTime.parse(json['createdTime'] as String),
      questionsMetadata: (json['questionsMetadata'] as List<dynamic>)
          .map((e) => QuestionMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      license: $enumDecode(_$LicenseEnumMap, json['license']),
      testResult: json['testResult'] == null
          ? null
          : TestResult.fromJson(json['testResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExamImplToJson(_$ExamImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdTime': instance.createdTime.toIso8601String(),
      'questionsMetadata':
          instance.questionsMetadata.map((e) => e.toJson()).toList(),
      'license': _$LicenseEnumMap[instance.license]!,
      'testResult': instance.testResult?.toJson(),
    };

const _$LicenseEnumMap = {
  License.all: 'all',
  License.a1: 'a1',
  License.a2: 'a2',
  License.a3: 'a3',
  License.a4: 'a4',
  License.b1: 'b1',
  License.b2: 'b2',
};
