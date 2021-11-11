import 'dart:async';

import 'package:super_halo/api/get_halo.dart';

// 参考：https://api.halo.run/content-api.html#operation/getProfileUsingGET_1
class Profile {
  final int id;
  final String username;
  final String nickname;
  final String email;
  final String avatar;
  final String description;
  final String mfaType;
  final int createTime;
  final int updateTime;

  Profile.formJson(Map<String, dynamic> json)
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

class Users {
  static Future<Profile?> getProfile() async {
    final GetHalo get = await GetHalo.formLink('content/users/profile');

    if (get.status == 200) {
      return Profile.formJson(get.data);
    } else {
      // TODO: 处理失败请求
      return null;
    }
  }
}