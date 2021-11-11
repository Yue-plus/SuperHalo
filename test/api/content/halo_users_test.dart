import 'preparation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_halo/api/content/halo_users.dart';

void main() async {
  await preparation();

  test('content/users/profile', () async {
    HaloProfile? profile = await HaloUsers.getProfile();
    expect(profile!, profile);
  });
}