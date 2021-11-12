import 'preparation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_halo/halo_api/content/theme_controller.dart';

void main() async {
  await preparation();

  test('content/themes/activation', () async {
    ActivatedThemeProperty? activation
      = await ThemeController.getsActivatedThemeProperty();
    expect(activation!, activation);
  });

  test('content/themes/activation/settings', () async {
    HaloActivationSettings? activationSettings
      = await ThemeController.getListsActivatedThemeSettings();
    expect(activationSettings!, activationSettings);
  });
}