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

class HaloTags {
  static Future<HaloTags?> getTags() async {
    final get = await GetHalo.formLink('content/tags');

    if (get.status == 200) {
      // TODO: 序列化 JSON
      return null;
      // return Tag.formJson(get.data);
    } else {
      // TODO: 处理失败请求
      return null;
    }
  }
}