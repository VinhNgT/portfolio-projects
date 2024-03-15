// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAnswer _$UserAnswerFromJson(Map<String, dynamic> json) {
  return _UserAnswer.fromJson(json);
}

/// @nodoc
mixin _$UserAnswer {
  int get questionDbIndex => throw _privateConstructorUsedError;
  int get selectedAnswerIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAnswerCopyWith<UserAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswerCopyWith<$Res> {
  factory $UserAnswerCopyWith(
          UserAnswer value, $Res Function(UserAnswer) then) =
      _$UserAnswerCopyWithImpl<$Res, UserAnswer>;
  @useResult
  $Res call({int questionDbIndex, int selectedAnswerIndex});
}

/// @nodoc
class _$UserAnswerCopyWithImpl<$Res, $Val extends UserAnswer>
    implements $UserAnswerCopyWith<$Res> {
  _$UserAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? selectedAnswerIndex = null,
  }) {
    return _then(_value.copyWith(
      questionDbIndex: null == questionDbIndex
          ? _value.questionDbIndex
          : questionDbIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAnswerIndex: null == selectedAnswerIndex
          ? _value.selectedAnswerIndex
          : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAnswerImplCopyWith<$Res>
    implements $UserAnswerCopyWith<$Res> {
  factory _$$UserAnswerImplCopyWith(
          _$UserAnswerImpl value, $Res Function(_$UserAnswerImpl) then) =
      __$$UserAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int questionDbIndex, int selectedAnswerIndex});
}

/// @nodoc
class __$$UserAnswerImplCopyWithImpl<$Res>
    extends _$UserAnswerCopyWithImpl<$Res, _$UserAnswerImpl>
    implements _$$UserAnswerImplCopyWith<$Res> {
  __$$UserAnswerImplCopyWithImpl(
      _$UserAnswerImpl _value, $Res Function(_$UserAnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? selectedAnswerIndex = null,
  }) {
    return _then(_$UserAnswerImpl(
      questionDbIndex: null == questionDbIndex
          ? _value.questionDbIndex
          : questionDbIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAnswerIndex: null == selectedAnswerIndex
          ? _value.selectedAnswerIndex
          : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAnswerImpl implements _UserAnswer {
  _$UserAnswerImpl(
      {required this.questionDbIndex, required this.selectedAnswerIndex});

  factory _$UserAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAnswerImplFromJson(json);

  @override
  final int questionDbIndex;
  @override
  final int selectedAnswerIndex;

  @override
  String toString() {
    return 'UserAnswer(questionDbIndex: $questionDbIndex, selectedAnswerIndex: $selectedAnswerIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAnswerImpl &&
            (identical(other.questionDbIndex, questionDbIndex) ||
                other.questionDbIndex == questionDbIndex) &&
            (identical(other.selectedAnswerIndex, selectedAnswerIndex) ||
                other.selectedAnswerIndex == selectedAnswerIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionDbIndex, selectedAnswerIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAnswerImplCopyWith<_$UserAnswerImpl> get copyWith =>
      __$$UserAnswerImplCopyWithImpl<_$UserAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAnswerImplToJson(
      this,
    );
  }
}

abstract class _UserAnswer implements UserAnswer {
  factory _UserAnswer(
      {required final int questionDbIndex,
      required final int selectedAnswerIndex}) = _$UserAnswerImpl;

  factory _UserAnswer.fromJson(Map<String, dynamic> json) =
      _$UserAnswerImpl.fromJson;

  @override
  int get questionDbIndex;
  @override
  int get selectedAnswerIndex;
  @override
  @JsonKey(ignore: true)
  _$$UserAnswerImplCopyWith<_$UserAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
