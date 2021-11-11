import 'dart:async';
import 'dart:convert';

import 'package:super_halo/api/get_halo.dart';

// 参考：https://api.halo.run/content-api.html#operation/getProfileUsingGET_1
class HaloProfile {
  final int id;
  final String username;
  final String nickname;
  final String email;
  final String avatar;
  final String description;
  final String mfaType;
  final int createTime;
  final int updateTime;

  HaloProfile.formJson(Map<String, dynamic> json)
    : id = json['id'],
      username = json['username'],
      nickname = json['nickname'],
      email = json['email'],
      avatar = json['avatar'],
      description = json['description'],
      mfaType = json['mfaType'],
      createTime = json['createTime'],
      updateTime = json['updateTime'];
}

class HaloUsers {
  static Future<HaloProfile?> getProfile() async {
    final get = await GetHalo.formLink('content/users/profile');

    if (get.status == 200) {
      return HaloProfile.formJson(jsonDecode(get.data));
    } else {
      // TODO: 处理失败请求
      return null;
    }
  }
}