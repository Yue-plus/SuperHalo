import 'dart:async';

import 'package:super_halo/api/halo.dart';

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

  Profile.formJson(Map<dynamic, dynamic> json)
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
  Users() {
    Halo halo = Halo.formLink('content/users/profile');
    Profile profile = Profile.formJson(halo.data);
    Timer(const Duration(minutes: 3), () {
      print(halo.message);
      print(profile.avatar);
    });
  }
}