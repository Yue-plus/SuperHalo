import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_halo/halo_api/get_request.dart';

// 参考：https://api.halo.run/content-api.html#operation/getProfileUsingGET_1
class BloggerProfile {
  final int id;
  final String username;
  final String nickname;
  final String email;
  final String avatar;
  final String description;
  final String mfaType;
  final int createTime;
  final int updateTime;

  BloggerProfile.formJson(Map<String, dynamic> json)
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

class UserController {
  /// 获取博客简介，如果传入 [context] 则会弹出提示框
  static Future<BloggerProfile?> getsBloggerProfile(
      [BuildContext? context]) async {
    final get = await GetRequest.formLink('content/users/profile', context);
    if (get != null) {
      return BloggerProfile.formJson(jsonDecode(get.data));
    } else {
      return null;
    }
  }
}