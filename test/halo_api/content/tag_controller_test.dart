import 'preparation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_halo/halo_api/content/tag_controller.dart';

void main() async {
  await preparation();

  test('content/tags', () async {
    List<Tag>? haloTags = await TagController.getListTags();
    expect(haloTags!, haloTags);
  });

  test('content/tags/{slug}/posts', () async {
    await TagController.getListsPostsByTagSlug('markdown');
  });
}