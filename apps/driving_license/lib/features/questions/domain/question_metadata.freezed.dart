// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionMetadata _$QuestionMetadataFromJson(Map<String, dynamic> json) {
  return _QuestionMetadata.fromJson(json);
}

/// @nodoc
mixin _$QuestionMetadata {
  int get questionDbIndex => throw _privateConstructorUsedError;
  int get chapterDbIndex => throw _privateConstructorUsedError;
  bool get isDanger => throw _privateConstructorUsedError;
  bool get isDifficult => throw _privateConstructorUsedError;
  int get correctAnswerIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionMetadataCopyWith<QuestionMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionMetadataCopyWith<$Res> {
  factory $QuestionMetadataCopyWith(
          QuestionMetadata value, $Res Function(QuestionMetadata) then) =
      _$QuestionMetadataCopyWithImpl<$Res, QuestionMetadata>;
  @useResult
  $Res call(
      {int questionDbIndex,
      int chapterDbIndex,
      bool isDanger,
      bool isDifficult,
      int correctAnswerIndex});
}

/// @nodoc
class _$QuestionMetadataCopyWithImpl<$Res, $Val extends QuestionMetadata>
    implements $QuestionMetadataCopyWith<$Res> {
  _$QuestionMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? chapterDbIndex = null,
    Object? isDanger = null,
    Object? isDifficult = null,
    Object? correctAnswerIndex = null,
  }) {
    return _then(_value.copyWith(
      questionDbIndex: null == questionDbIndex
          ? _value.questionDbIndex
          : questionDbIndex // ignore: cast_nullable_to_non_nullable
              as int,
      chapterDbIndex: null == chapterDbIndex
          ? _value.chapterDbIndex
          : chapterDbIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isDanger: null == isDanger
          ? _value.isDanger
          : isDanger // ignore: cast_nullable_to_non_nullable
              as bool,
      isDifficult: null == isDifficult
          ? _value.isDifficult
          : isDifficult // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswerIndex: null == correctAnswerIndex
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionMetadataImplCopyWith<$Res>
    implements $QuestionMetadataCopyWith<$Res> {
  factory _$$QuestionMetadataImplCopyWith(_$QuestionMetadataImpl value,
          $Res Function(_$QuestionMetadataImpl) then) =
      __$$QuestionMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int questionDbIndex,
      int chapterDbIndex,
      bool isDanger,
      bool isDifficult,
      int correctAnswerIndex});
}

/// @nodoc
class __$$QuestionMetadataImplCopyWithImpl<$Res>
    extends _$QuestionMetadataCopyWithImpl<$Res, _$QuestionMetadataImpl>
    implements _$$QuestionMetadataImplCopyWith<$Res> {
  __$$QuestionMetadataImplCopyWithImpl(_$QuestionMetadataImpl _value,
      $Res Function(_$QuestionMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? chapterDbIndex = null,
    Object? isDanger = null,
    Object? isDifficult = null,
    Object? correctAnswerIndex = null,
  }) {
    return _then(_$QuestionMetadataImpl(
      questionDbIndex: null == questionDbIndex
          ? _value.questionDbIndex
          : questionDbIndex // ignore: cast_nullable_to_non_nullable
              as int,
      chapterDbIndex: null == chapterDbIndex
          ? _value.chapterDbIndex
          : chapterDbIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isDanger: null == isDanger
          ? _value.isDanger
          : isDanger // ignore: cast_nullable_to_non_nullable
              as bool,
      isDifficult: null == isDifficult
          ? _value.isDifficult
          : isDifficult // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswerIndex: null == correctAnswerIndex
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionMetadataImpl implements _QuestionMetadata {
  const _$QuestionMetadataImpl(
      {required this.questionDbIndex,
      required this.chapterDbIndex,
      required this.isDanger,
      required this.isDifficult,
      required this.correctAnswerIndex});

  factory _$QuestionMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionMetadataImplFromJson(json);

  @override
  final int questionDbIndex;
  @override
  final int chapterDbIndex;
  @override
  final bool isDanger;
  @override
  final bool isDifficult;
  @override
  final int correctAnswerIndex;

  @override
  String toString() {
    return 'QuestionMetadata(questionDbIndex: $questionDbIndex, chapterDbIndex: $chapterDbIndex, isDanger: $isDanger, isDifficult: $isDifficult, correctAnswerIndex: $correctAnswerIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionMetadataImpl &&
            (identical(other.questionDbIndex, questionDbIndex) ||
                other.questionDbIndex == questionDbIndex) &&
            (identical(other.chapterDbIndex, chapterDbIndex) ||
                other.chapterDbIndex == chapterDbIndex) &&
            (identical(other.isDanger, isDanger) ||
                other.isDanger == isDanger) &&
            (identical(other.isDifficult, isDifficult) ||
                other.isDifficult == isDifficult) &&
            (identical(other.correctAnswerIndex, correctAnswerIndex) ||
                other.correctAnswerIndex == correctAnswerIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionDbIndex, chapterDbIndex,
      isDanger, isDifficult, correctAnswerIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionMetadataImplCopyWith<_$QuestionMetadataImpl> get copyWith =>
      __$$QuestionMetadataImplCopyWithImpl<_$QuestionMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionMetadataImplToJson(
      this,
    );
  }
}

abstract class _QuestionMetadata implements QuestionMetadata {
  const factory _QuestionMetadata(
      {required final int questionDbIndex,
      required final int chapterDbIndex,
      required final bool isDanger,
      required final bool isDifficult,
      required final int correctAnswerIndex}) = _$QuestionMetadataImpl;

  factory _QuestionMetadata.fromJson(Map<String, dynamic> json) =
      _$QuestionMetadataImpl.fromJson;

  @override
  int get questionDbIndex;
  @override
  int get chapterDbIndex;
  @override
  bool get isDanger;
  @override
  bool get isDifficult;
  @override
  int get correctAnswerIndex;
  @override
  @JsonKey(ignore: true)
  _$$QuestionMetadataImplCopyWith<_$QuestionMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
