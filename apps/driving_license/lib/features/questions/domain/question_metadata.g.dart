// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionMetadataImpl _$$QuestionMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionMetadataImpl(
      questionDbIndex: json['questionDbIndex'] as int,
      chapterDbIndex: json['chapterDbIndex'] as int,
      isDanger: json['isDanger'] as bool,
      isDifficult: json['isDifficult'] as bool,
      correctAnswerIndex: json['correctAnswerIndex'] as int,
    );

Map<String, dynamic> _$$QuestionMetadataImplToJson(
        _$QuestionMetadataImpl instance) =>
    <String, dynamic>{
      'questionDbIndex': instance.questionDbIndex,
      'chapterDbIndex': instance.chapterDbIndex,
      'isDanger': instance.isDanger,
      'isDifficult': instance.isDifficult,
      'correctAnswerIndex': instance.correctAnswerIndex,
    };
