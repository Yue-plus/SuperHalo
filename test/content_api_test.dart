import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_halo/api/content/themes.dart';
import 'package:super_halo/api/content/users.dart';

void main() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  await sp.setString('HOST_LINK', 'http://localhost:8090/api/');
  await sp.setString('ACCESS_KEY', '123');

  test('content/themes/activation', () async {
    Activation? activation = await Themes.getActivation();
    expect(activation!, activation);
  });

  test('content/themes/activation/settings', () async {
    ActivationSettings? activationSettings
      = await Themes.getActivationSettings();
    expect(activationSettings!, activationSettings);
  });

  test('content/users/profile', () async {
    Profile? profile = await Users.getProfile();
    expect(profile!, profile);
  });
}