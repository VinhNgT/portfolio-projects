// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exam _$ExamFromJson(Map<String, dynamic> json) {
  return _Exam.fromJson(json);
}

/// @nodoc
mixin _$Exam {
  String get name => throw _privateConstructorUsedError;
  DateTime get createdTime => throw _privateConstructorUsedError;
  List<QuestionMetadata> get questionsMetadata =>
      throw _privateConstructorUsedError;
  License get license => throw _privateConstructorUsedError;
  TestResult? get testResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExamCopyWith<Exam> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamCopyWith<$Res> {
  factory $ExamCopyWith(Exam value, $Res Function(Exam) then) =
      _$ExamCopyWithImpl<$Res, Exam>;
  @useResult
  $Res call(
      {String name,
      DateTime createdTime,
      List<QuestionMetadata> questionsMetadata,
      License license,
      TestResult? testResult});

  $TestResultCopyWith<$Res>? get testResult;
}

/// @nodoc
class _$ExamCopyWithImpl<$Res, $Val extends Exam>
    implements $ExamCopyWith<$Res> {
  _$ExamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? createdTime = null,
    Object? questionsMetadata = null,
    Object? license = null,
    Object? testResult = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionsMetadata: null == questionsMetadata
          ? _value.questionsMetadata
          : questionsMetadata // ignore: cast_nullable_to_non_nullable
              as List<QuestionMetadata>,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as License,
      testResult: freezed == testResult
          ? _value.testResult
          : testResult // ignore: cast_nullable_to_non_nullable
              as TestResult?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TestResultCopyWith<$Res>? get testResult {
    if (_value.testResult == null) {
      return null;
    }

    return $TestResultCopyWith<$Res>(_value.testResult!, (value) {
      return _then(_value.copyWith(testResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExamImplCopyWith<$Res> implements $ExamCopyWith<$Res> {
  factory _$$ExamImplCopyWith(
          _$ExamImpl value, $Res Function(_$ExamImpl) then) =
      __$$ExamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      DateTime createdTime,
      List<QuestionMetadata> questionsMetadata,
      License license,
      TestResult? testResult});

  @override
  $TestResultCopyWith<$Res>? get testResult;
}

/// @nodoc
class __$$ExamImplCopyWithImpl<$Res>
    extends _$ExamCopyWithImpl<$Res, _$ExamImpl>
    implements _$$ExamImplCopyWith<$Res> {
  __$$ExamImplCopyWithImpl(_$ExamImpl _value, $Res Function(_$ExamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? createdTime = null,
    Object? questionsMetadata = null,
    Object? license = null,
    Object? testResult = freezed,
  }) {
    return _then(_$ExamImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionsMetadata: null == questionsMetadata
          ? _value._questionsMetadata
          : questionsMetadata // ignore: cast_nullable_to_non_nullable
              as List<QuestionMetadata>,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as License,
      testResult: freezed == testResult
          ? _value.testResult
          : testResult // ignore: cast_nullable_to_non_nullable
              as TestResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamImpl implements _Exam {
  const _$ExamImpl(
      {required this.name,
      required this.createdTime,
      required final List<QuestionMetadata> questionsMetadata,
      required this.license,
      this.testResult})
      : _questionsMetadata = questionsMetadata;

  factory _$ExamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamImplFromJson(json);

  @override
  final String name;
  @override
  final DateTime createdTime;
  final List<QuestionMetadata> _questionsMetadata;
  @override
  List<QuestionMetadata> get questionsMetadata {
    if (_questionsMetadata is EqualUnmodifiableListView)
      return _questionsMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionsMetadata);
  }

  @override
  final License license;
  @override
  final TestResult? testResult;

  @override
  String toString() {
    return 'Exam(name: $name, createdTime: $createdTime, questionsMetadata: $questionsMetadata, license: $license, testResult: $testResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            const DeepCollectionEquality()
                .equals(other._questionsMetadata, _questionsMetadata) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.testResult, testResult) ||
                other.testResult == testResult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      createdTime,
      const DeepCollectionEquality().hash(_questionsMetadata),
      license,
      testResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      __$$ExamImplCopyWithImpl<_$ExamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamImplToJson(
      this,
    );
  }
}

abstract class _Exam implements Exam {
  const factory _Exam(
      {required final String name,
      required final DateTime createdTime,
      required final List<QuestionMetadata> questionsMetadata,
      required final License license,
      final TestResult? testResult}) = _$ExamImpl;

  factory _Exam.fromJson(Map<String, dynamic> json) = _$ExamImpl.fromJson;

  @override
  String get name;
  @override
  DateTime get createdTime;
  @override
  List<QuestionMetadata> get questionsMetadata;
  @override
  License get license;
  @override
  TestResult? get testResult;
  @override
  @JsonKey(ignore: true)
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
