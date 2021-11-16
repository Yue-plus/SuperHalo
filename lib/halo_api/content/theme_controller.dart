import 'dart:convert';

import 'package:super_halo/halo_api/get_request.dart';

// 参考：https://api.halo.run/content-api.html#operation/getByUsingGET_18
class ActivatedThemeProperty {
  final String id;
  final String name;
  final String website;
  final String branch;
  final String repo;
  final String updateStrategy;
  final String description;
  final String logo;
  final String version;
  final String require;
  final String authorName;
  final String authorWebsite;
  final String? authorAvatar;
  final String themePath;
  final String folderName;
  final bool hasOptions;
  final String screenshots;
  final String? postMetaField;
  final String? sheetMetaField;
  final bool activated;

  ActivatedThemeProperty.formJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        website = json['website'],
        branch = json['branch'],
        repo = json['repo'],
        updateStrategy = json['updateStrategy'],
        description = json['description'],
        logo = json['logo'],
        version = json['version'],
        require = json['require'],
        authorName = json['author']['name'],
        authorWebsite = json['author']['website'],
        authorAvatar = json['author']['avatar'],
        themePath = json['themePath'],
        folderName = json['folderName'],
        hasOptions = json['hasOptions'],
        screenshots = json['screenshots'],
        postMetaField = json['postMetaField'],
        sheetMetaField = json['sheetMetaField'],
        activated = json['activated'];
}

// 参考：https://api.halo.run/content-api.html#operation/listSettingsByUsingGET_2
class HaloActivationSettings {
  final bool postTitleUppper;
  final String scrollbar;
  final bool avatarCircle;
  final bool blogTitleUppper;
  final bool hitokoto;
  final bool rss;
  final String googleColor;
  final String? codePretty;

  HaloActivationSettings.formJson(Map<String, dynamic> json)
      : postTitleUppper = json['post_title_uppper'],
        scrollbar = json['scrollbar'],
        avatarCircle = json['avatar_circle'],
        blogTitleUppper = json['blog_title_uppper'],
        hitokoto = json['hitokoto'],
        rss = json['rss'],
        googleColor = json['google_color'],
        codePretty = json['code_pretty'];
}

class ThemeController {
  /// 获取激活的主题属性
  static Future<ActivatedThemeProperty?> getsActivatedThemeProperty() async {
    final get = await GetRequest.formLink('content/themes/activation');

    if (get != null) {
      return ActivatedThemeProperty.formJson(jsonDecode(get.data));
    } else {
      return null;
    }
  }

  /// 列出激活的主题设置
  static Future<HaloActivationSettings?>
      getListsActivatedThemeSettings() async {
    final get = await GetRequest.formLink('content/themes/activation/settings');

    if (get != null) {
      return HaloActivationSettings.formJson(jsonDecode(get.data));
    } else {
      return null;
    }
  }
}
