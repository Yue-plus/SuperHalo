import 'dart:convert';

import 'package:super_halo/halo_api/get_request.dart';

class Menu {
  final int id;
  final String name;
  final String url;
  final int priority;
  final String target;
  final String icon;
  final int parentId;
  final String team;

  Menu.formJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        priority = json['priority'],
        target = json['target'],
        icon = json['icon'],
        parentId = json['parentId'],
        team = json['team'];
}

class MenuWithTreeView extends Menu {
  final List children;

  @override
  MenuWithTreeView.formJson(Map<String, dynamic> json)
      : children = json['children'],
        super.formJson(json);
}

class MenuController {
  static Future<List<Menu>?> getListsAllMenus() async {
    final get = await GetRequest.formLink('content/menus');

    if (get != null) {
      final List<Menu> menus = [];
      for (var element in jsonDecode(get.data)) {
        menus.add(Menu.formJson(element));
      }
      return menus;
    } else {
      return null;
    }
  }

  static getListsMenusWithTreeView() async {
    final get = await GetRequest.formLink('content/menus/tree_view');

    if (get != null) {
      final List<MenuWithTreeView> menusWithTreeView = [];
      for (var element in jsonDecode(get.data)) {
        menusWithTreeView.add(MenuWithTreeView.formJson(element));
      }
    } else {
      return null;
    }
  }
}
