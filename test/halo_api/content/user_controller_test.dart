import 'preparation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_halo/halo_api/content/user_controller.dart';

void main() async {
  await preparation();

  test('content/users/profile', () async {
    BloggerProfile? profile = await UserController.getsBloggerProfile();
    expect(profile!, profile);
  });
}