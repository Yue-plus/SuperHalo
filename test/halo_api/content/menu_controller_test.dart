import 'preparation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_halo/halo_api/content/menu_controller.dart';

void main() async {
  await preparation();

  test('content/menus', () async {
    List<Menu>? menu = await MenuController.getListsAllMenus();
    expect(menu!, menu);
  });

  test('content/menus/tree_view', () async {
    List<Menu>? listsMenuWithTreeView =
        await MenuController.getListsMenusWithTreeView();
    expect(listsMenuWithTreeView!, listsMenuWithTreeView);
  });
}
