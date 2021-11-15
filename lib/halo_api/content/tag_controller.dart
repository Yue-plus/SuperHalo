import 'dart:convert';

import 'package:super_halo/halo_api/get_request.dart';

class Tag {
  final int id;
  final String name;
  final String slug;
  final String? thumbnail;
  final int createTime;
  final String fullPath;

  Tag.formJson(Map<String, dynamic> json)
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

class TagController {
  /// 列出标签
  static Future<List<Tag>?> getListTags() async {
    final get = await GetRequest.formLink('content/tags');

    if (get.status == 200) {
      final List<Tag> tags = [];
      for (var element in jsonDecode(get.data)) {
        tags.add(Tag.formJson(element));
      }
      return tags;
    } else {
      // TODO: 处理失败请求
      return null;
    }
  }

  /// 按标签 [slug] 列出博文
  static getListsPostsByTagSlug(String slug) async {
    final get = await GetRequest.formLink('content/tags/$slug/posts');

    if (get.status == 200) {
      print(get.data);
    } else {
      return null;
    }
  }
}