import 'preparation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_halo/api/content/halo_tags.dart';

void main() async {
  await preparation();

  test('content/tags', () async {
    List<HaloTag>? haloTags = await HaloTags.getTags();
    expect(haloTags!, haloTags);
  });
}