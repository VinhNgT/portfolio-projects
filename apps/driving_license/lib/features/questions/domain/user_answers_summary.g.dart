// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answers_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAnswersSummaryImpl _$$UserAnswersSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAnswersSummaryImpl(
      correctAnswers: (json['correctAnswers'] as num).toInt(),
      wrongAnswers: (json['wrongAnswers'] as num).toInt(),
      wrongAnswersIsDanger: (json['wrongAnswersIsDanger'] as num).toInt(),
    );

Map<String, dynamic> _$$UserAnswersSummaryImplToJson(
        _$UserAnswersSummaryImpl instance) =>
    <String, dynamic>{
      'correctAnswers': instance.correctAnswers,
      'wrongAnswers': instance.wrongAnswers,
      'wrongAnswersIsDanger': instance.wrongAnswersIsDanger,
    };
