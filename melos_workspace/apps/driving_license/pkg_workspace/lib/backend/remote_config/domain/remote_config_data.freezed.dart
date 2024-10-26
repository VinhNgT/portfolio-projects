// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigData _$RemoteConfigDataFromJson(Map<String, dynamic> json) {
  return _RemoteConfigData.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigData {
  @JsonKey(name: 'gs_feedback_post_link')
  String get gsFeedbackPostLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'disable_donation_card')
  bool get disableDonationCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlock_all_features')
  bool get unlockAllFeatures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigDataCopyWith<RemoteConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigDataCopyWith<$Res> {
  factory $RemoteConfigDataCopyWith(
          RemoteConfigData value, $Res Function(RemoteConfigData) then) =
      _$RemoteConfigDataCopyWithImpl<$Res, RemoteConfigData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gs_feedback_post_link') String gsFeedbackPostLink,
      @JsonKey(name: 'disable_donation_card') bool disableDonationCard,
      @JsonKey(name: 'unlock_all_features') bool unlockAllFeatures});
}

/// @nodoc
class _$RemoteConfigDataCopyWithImpl<$Res, $Val extends RemoteConfigData>
    implements $RemoteConfigDataCopyWith<$Res> {
  _$RemoteConfigDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsFeedbackPostLink = null,
    Object? disableDonationCard = null,
    Object? unlockAllFeatures = null,
  }) {
    return _then(_value.copyWith(
      gsFeedbackPostLink: null == gsFeedbackPostLink
          ? _value.gsFeedbackPostLink
          : gsFeedbackPostLink // ignore: cast_nullable_to_non_nullable
              as String,
      disableDonationCard: null == disableDonationCard
          ? _value.disableDonationCard
          : disableDonationCard // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockAllFeatures: null == unlockAllFeatures
          ? _value.unlockAllFeatures
          : unlockAllFeatures // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigDataImplCopyWith<$Res>
    implements $RemoteConfigDataCopyWith<$Res> {
  factory _$$RemoteConfigDataImplCopyWith(_$RemoteConfigDataImpl value,
          $Res Function(_$RemoteConfigDataImpl) then) =
      __$$RemoteConfigDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gs_feedback_post_link') String gsFeedbackPostLink,
      @JsonKey(name: 'disable_donation_card') bool disableDonationCard,
      @JsonKey(name: 'unlock_all_features') bool unlockAllFeatures});
}

/// @nodoc
class __$$RemoteConfigDataImplCopyWithImpl<$Res>
    extends _$RemoteConfigDataCopyWithImpl<$Res, _$RemoteConfigDataImpl>
    implements _$$RemoteConfigDataImplCopyWith<$Res> {
  __$$RemoteConfigDataImplCopyWithImpl(_$RemoteConfigDataImpl _value,
      $Res Function(_$RemoteConfigDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsFeedbackPostLink = null,
    Object? disableDonationCard = null,
    Object? unlockAllFeatures = null,
  }) {
    return _then(_$RemoteConfigDataImpl(
      gsFeedbackPostLink: null == gsFeedbackPostLink
          ? _value.gsFeedbackPostLink
          : gsFeedbackPostLink // ignore: cast_nullable_to_non_nullable
              as String,
      disableDonationCard: null == disableDonationCard
          ? _value.disableDonationCard
          : disableDonationCard // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockAllFeatures: null == unlockAllFeatures
          ? _value.unlockAllFeatures
          : unlockAllFeatures // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigDataImpl implements _RemoteConfigData {
  const _$RemoteConfigDataImpl(
      {@JsonKey(name: 'gs_feedback_post_link') required this.gsFeedbackPostLink,
      @JsonKey(name: 'disable_donation_card') required this.disableDonationCard,
      @JsonKey(name: 'unlock_all_features') required this.unlockAllFeatures});

  factory _$RemoteConfigDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigDataImplFromJson(json);

  @override
  @JsonKey(name: 'gs_feedback_post_link')
  final String gsFeedbackPostLink;
  @override
  @JsonKey(name: 'disable_donation_card')
  final bool disableDonationCard;
  @override
  @JsonKey(name: 'unlock_all_features')
  final bool unlockAllFeatures;

  @override
  String toString() {
    return 'RemoteConfigData(gsFeedbackPostLink: $gsFeedbackPostLink, disableDonationCard: $disableDonationCard, unlockAllFeatures: $unlockAllFeatures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigDataImpl &&
            (identical(other.gsFeedbackPostLink, gsFeedbackPostLink) ||
                other.gsFeedbackPostLink == gsFeedbackPostLink) &&
            (identical(other.disableDonationCard, disableDonationCard) ||
                other.disableDonationCard == disableDonationCard) &&
            (identical(other.unlockAllFeatures, unlockAllFeatures) ||
                other.unlockAllFeatures == unlockAllFeatures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, gsFeedbackPostLink, disableDonationCard, unlockAllFeatures);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigDataImplCopyWith<_$RemoteConfigDataImpl> get copyWith =>
      __$$RemoteConfigDataImplCopyWithImpl<_$RemoteConfigDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigDataImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigData implements RemoteConfigData {
  const factory _RemoteConfigData(
      {@JsonKey(name: 'gs_feedback_post_link')
      required final String gsFeedbackPostLink,
      @JsonKey(name: 'disable_donation_card')
      required final bool disableDonationCard,
      @JsonKey(name: 'unlock_all_features')
      required final bool unlockAllFeatures}) = _$RemoteConfigDataImpl;

  factory _RemoteConfigData.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigDataImpl.fromJson;

  @override
  @JsonKey(name: 'gs_feedback_post_link')
  String get gsFeedbackPostLink;
  @override
  @JsonKey(name: 'disable_donation_card')
  bool get disableDonationCard;
  @override
  @JsonKey(name: 'unlock_all_features')
  bool get unlockAllFeatures;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigDataImplCopyWith<_$RemoteConfigDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
