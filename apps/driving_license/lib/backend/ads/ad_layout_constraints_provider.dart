import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ad_layout_constraints_provider.g.dart';

@Riverpod(keepAlive: true)
class AdLayoutConstraints extends _$AdLayoutConstraints {
  @override
  Map<AdUnit, BoxConstraints> build() {
    return {};
  }

  void setConstraints(AdUnit adUnit, BoxConstraints constraints) {
    state = {...state, adUnit: constraints};
  }
}
