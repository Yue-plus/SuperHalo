import 'dart:convert';

import 'package:super_halo/api/get_halo.dart';

class HaloTag {
  final int id;
  final String name;
  final String slug;
  final String? thumbnail;
  final int createTime;
  final String fullPath;

  HaloTag.formJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      slug = json['slug'],
      thumbnail = json['thumbnail'],
      createTime = json['createTime'],
      fullPath = json['fullPath'];
}

class ListsPostsByTagSlug {
  // TODO: 待完成类
}

class HaloTags {
  static Future<List<HaloTag>?> getTags() async {
    final get = await GetHalo.formLink('content/tags');

    if (get.status == 200) {
      final List<HaloTag> tags = [];
      for (var element in jsonDecode(get.data)) {
        tags.add(HaloTag.formJson(element));
      }
      return tags;
    } else {
      // TODO: 处理失败请求
      return null;
    }
  }

  static getPostsByTagSlug(String slug) async {
    final get = await GetHalo.formLink('content/tags/$slug/posts');

    if (get.status == 200) {
      print(get.data);
    } else {
      return null;
    }
  }
}