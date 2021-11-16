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

class ListsPostsByTagSlugContent {
  int id;
  String title;
  String status;
  String slug;
  String editorType;
  int updateTime;
  int createTime;
  int editTime;
  String? metaKeywords;
  String? metaDescription;
  String fullPath;
  String summary;
  String thumbnail;
  int visits;
  bool disallowComment;
  String password;
  String template;
  String topPriority;
  int likes;
  int wordCount;
  int commentCount;
  List<Tag> tags;
  List categories;
  String metas;
  bool topped;

  ListsPostsByTagSlugContent.formJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      status = json['status'],
      slug = json['slug'],
      editorType = json['editorType'],
      updateTime = json['updateTime'],
      createTime = json['createTime'],
      editTime = json['editTime'],
      metaKeywords = json['metaKeywords'],
      metaDescription = json['metaDescription'],
      fullPath = json['fullPath'],
      summary = json['summary'],
      thumbnail = json['thumbnail'],
      visits = json['visits'],
      disallowComment = json['disallowComment'],
      password = json['password'],
      template = json['template'],
      topPriority = json['topPriority'],
      likes = json['likes'],
      wordCount = json['wordCount'],
      commentCount = json['commentCount'],
      tags = json['tags'],
      categories = json['categories'],
      metas = json['metas'],
      topped = json['topped'];
}

class ListsPostsByTagSlug {
  int pages;
  int total;
  int page;
  int rpp;
  bool hasNext;
  bool hasPrevious;
  bool isFirst;
  bool isLast;
  bool isEmpty;
  bool hasContent;

  ListsPostsByTagSlug.formJson(Map<String, dynamic> json)
    : pages = json['pages'],
      total = json['total'],
      page = json['page'],
      rpp = json['rpp'],
      hasNext = json['hasNext'],
      hasPrevious = json['hasPrevious'],
      isFirst = json['isFirst'],
      isLast = json['isLast'],
      isEmpty = json['isEmpty'],
      hasContent = json['hasContent'];
}

class TagController {
  /// 列出标签
  static Future<List<Tag>?> getListTags() async {
    final get = await GetRequest.formLink('content/tags');

    if (get != null) {
      final List<Tag> tags = [];
      for (var element in jsonDecode(get.data)) {
        tags.add(Tag.formJson(element));
      }
      return tags;
    } else {
      return null;
    }
  }

  /// 按标签 [slug] 列出博文
  static getListsPostsByTagSlug(String slug) async {
    final get = await GetRequest.formLink('content/tags/$slug/posts');

    if (get != null) {
      print(get.data);
    } else {
      return null;
    }
  }
}