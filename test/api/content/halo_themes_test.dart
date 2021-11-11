import 'preparation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_halo/api/content/halo_themes.dart';

void main() async {
  await preparation();

  test('content/themes/activation', () async {
    HaloActivation? activation = await HaloThemes.getActivation();
    expect(activation!, activation);
  });

  test('content/themes/activation/settings', () async {
    HaloActivationSettings? activationSettings
    = await HaloThemes.getActivationSettings();
    expect(activationSettings!, activationSettings);
  });
}