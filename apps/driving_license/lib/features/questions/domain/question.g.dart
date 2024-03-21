// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      questionDbIndex: json['questionDbIndex'] as int,
      chapterDbIndex: json['chapterDbIndex'] as int,
      title: json['title'] as String,
      questionImagePath: json['questionImagePath'] as String?,
      isDanger: json['isDanger'] as bool,
      isDifficult: json['isDifficult'] as bool,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
      explanation: json['explanation'] as String?,
      rememberTip: json['rememberTip'] as String?,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'questionDbIndex': instance.questionDbIndex,
      'chapterDbIndex': instance.chapterDbIndex,
      'title': instance.title,
      'questionImagePath': instance.questionImagePath,
      'isDanger': instance.isDanger,
      'isDifficult': instance.isDifficult,
      'answers': instance.answers,
      'correctAnswerIndex': instance.correctAnswerIndex,
      'explanation': instance.explanation,
      'rememberTip': instance.rememberTip,
    };
