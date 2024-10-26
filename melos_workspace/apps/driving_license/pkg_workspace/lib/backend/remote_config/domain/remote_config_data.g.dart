// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigDataImpl _$$RemoteConfigDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteConfigDataImpl(
      gsFeedbackPostLink: json['gs_feedback_post_link'] as String,
      disableDonationCard: json['disable_donation_card'] as bool,
      unlockAllFeatures: json['unlock_all_features'] as bool,
    );

Map<String, dynamic> _$$RemoteConfigDataImplToJson(
        _$RemoteConfigDataImpl instance) =>
    <String, dynamic>{
      'gs_feedback_post_link': instance.gsFeedbackPostLink,
      'disable_donation_card': instance.disableDonationCard,
      'unlock_all_features': instance.unlockAllFeatures,
    };
