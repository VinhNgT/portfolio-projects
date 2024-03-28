import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/user_options/data/providers/share_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_selected_license_provider.g.dart';

@Riverpod(keepAlive: true)
class UserSelectedLicense extends _$UserSelectedLicense {
  final _prefsLicenseKey = 'selected_license';
  late SharedPreferences _prefs;

  @override
  FutureOr<License> build() async {
    _prefs = await ref.watch(sharedPreferencesProvider.future);
    await _prefs.setString(_prefsLicenseKey, 'a4');
    final selectedLicense = _prefs.getString(_prefsLicenseKey);

    return switch (selectedLicense) {
      'a1' => License.a1,
      'a2' => License.a2,
      'a3' => License.a3,
      'a4' => License.a4,
      'b1' => License.b1,
      'b2' => License.b2,
      _ => License.all,
    };
  }

  Future<void> selectLicense(License license) async {
    await _prefs.setString(_prefsLicenseKey, license.name);
    ref.invalidateSelf();
  }
}
