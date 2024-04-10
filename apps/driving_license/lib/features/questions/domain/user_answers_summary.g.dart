// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answers_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAnswersSummaryImpl _$$UserAnswersSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAnswersSummaryImpl(
      correctAnswers: json['correctAnswers'] as int,
      wrongAnswers: json['wrongAnswers'] as int,
      wrongAnswersIsDanger: json['wrongAnswersIsDanger'] as int,
    );

Map<String, dynamic> _$$UserAnswersSummaryImplToJson(
        _$UserAnswersSummaryImpl instance) =>
    <String, dynamic>{
      'correctAnswers': instance.correctAnswers,
      'wrongAnswers': instance.wrongAnswers,
      'wrongAnswersIsDanger': instance.wrongAnswersIsDanger,
    };
