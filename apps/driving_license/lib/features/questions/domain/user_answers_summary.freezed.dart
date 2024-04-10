// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answers_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAnswersSummary _$UserAnswersSummaryFromJson(Map<String, dynamic> json) {
  return _UserAnswersSummary.fromJson(json);
}

/// @nodoc
mixin _$UserAnswersSummary {
  int get correctAnswers => throw _privateConstructorUsedError;
  int get wrongAnswers => throw _privateConstructorUsedError;
  int get wrongAnswersIsDanger => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAnswersSummaryCopyWith<UserAnswersSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswersSummaryCopyWith<$Res> {
  factory $UserAnswersSummaryCopyWith(
          UserAnswersSummary value, $Res Function(UserAnswersSummary) then) =
      _$UserAnswersSummaryCopyWithImpl<$Res, UserAnswersSummary>;
  @useResult
  $Res call({int correctAnswers, int wrongAnswers, int wrongAnswersIsDanger});
}

/// @nodoc
class _$UserAnswersSummaryCopyWithImpl<$Res, $Val extends UserAnswersSummary>
    implements $UserAnswersSummaryCopyWith<$Res> {
  _$UserAnswersSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? wrongAnswersIsDanger = null,
  }) {
    return _then(_value.copyWith(
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswers: null == wrongAnswers
          ? _value.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswersIsDanger: null == wrongAnswersIsDanger
          ? _value.wrongAnswersIsDanger
          : wrongAnswersIsDanger // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAnswersSummaryImplCopyWith<$Res>
    implements $UserAnswersSummaryCopyWith<$Res> {
  factory _$$UserAnswersSummaryImplCopyWith(_$UserAnswersSummaryImpl value,
          $Res Function(_$UserAnswersSummaryImpl) then) =
      __$$UserAnswersSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int correctAnswers, int wrongAnswers, int wrongAnswersIsDanger});
}

/// @nodoc
class __$$UserAnswersSummaryImplCopyWithImpl<$Res>
    extends _$UserAnswersSummaryCopyWithImpl<$Res, _$UserAnswersSummaryImpl>
    implements _$$UserAnswersSummaryImplCopyWith<$Res> {
  __$$UserAnswersSummaryImplCopyWithImpl(_$UserAnswersSummaryImpl _value,
      $Res Function(_$UserAnswersSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? wrongAnswersIsDanger = null,
  }) {
    return _then(_$UserAnswersSummaryImpl(
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswers: null == wrongAnswers
          ? _value.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswersIsDanger: null == wrongAnswersIsDanger
          ? _value.wrongAnswersIsDanger
          : wrongAnswersIsDanger // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAnswersSummaryImpl extends _UserAnswersSummary {
  const _$UserAnswersSummaryImpl(
      {required this.correctAnswers,
      required this.wrongAnswers,
      required this.wrongAnswersIsDanger})
      : super._();

  factory _$UserAnswersSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAnswersSummaryImplFromJson(json);

  @override
  final int correctAnswers;
  @override
  final int wrongAnswers;
  @override
  final int wrongAnswersIsDanger;

  @override
  String toString() {
    return 'UserAnswersSummary(correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, wrongAnswersIsDanger: $wrongAnswersIsDanger)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAnswersSummaryImpl &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.wrongAnswers, wrongAnswers) ||
                other.wrongAnswers == wrongAnswers) &&
            (identical(other.wrongAnswersIsDanger, wrongAnswersIsDanger) ||
                other.wrongAnswersIsDanger == wrongAnswersIsDanger));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, correctAnswers, wrongAnswers, wrongAnswersIsDanger);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAnswersSummaryImplCopyWith<_$UserAnswersSummaryImpl> get copyWith =>
      __$$UserAnswersSummaryImplCopyWithImpl<_$UserAnswersSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAnswersSummaryImplToJson(
      this,
    );
  }
}

abstract class _UserAnswersSummary extends UserAnswersSummary {
  const factory _UserAnswersSummary(
      {required final int correctAnswers,
      required final int wrongAnswers,
      required final int wrongAnswersIsDanger}) = _$UserAnswersSummaryImpl;
  const _UserAnswersSummary._() : super._();

  factory _UserAnswersSummary.fromJson(Map<String, dynamic> json) =
      _$UserAnswersSummaryImpl.fromJson;

  @override
  int get correctAnswers;
  @override
  int get wrongAnswers;
  @override
  int get wrongAnswersIsDanger;
  @override
  @JsonKey(ignore: true)
  _$$UserAnswersSummaryImplCopyWith<_$UserAnswersSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
