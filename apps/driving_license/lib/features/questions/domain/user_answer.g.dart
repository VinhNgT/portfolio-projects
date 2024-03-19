// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAnswerImpl _$$UserAnswerImplFromJson(Map<String, dynamic> json) =>
    _$UserAnswerImpl(
      questionDbIndex: json['questionDbIndex'] as int,
      chapterDbIndex: json['chapterDbIndex'] as int,
      selectedAnswerIndex: json['selectedAnswerIndex'] as int,
    );

Map<String, dynamic> _$$UserAnswerImplToJson(_$UserAnswerImpl instance) =>
    <String, dynamic>{
      'questionDbIndex': instance.questionDbIndex,
      'chapterDbIndex': instance.chapterDbIndex,
      'selectedAnswerIndex': instance.selectedAnswerIndex,
    };
