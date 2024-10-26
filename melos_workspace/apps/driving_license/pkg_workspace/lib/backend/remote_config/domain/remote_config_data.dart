// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_data.freezed.dart';
part 'remote_config_data.g.dart';

@freezed
class RemoteConfigData with _$RemoteConfigData {
  const factory RemoteConfigData({
    @JsonKey(name: 'gs_feedback_post_link') required String gsFeedbackPostLink,
    @JsonKey(name: 'disable_donation_card') required bool disableDonationCard,
    @JsonKey(name: 'unlock_all_features') required bool unlockAllFeatures,
  }) = _RemoteConfigData;

  factory RemoteConfigData.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigDataFromJson(json);
}
