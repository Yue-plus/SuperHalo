import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile {
  final int status;
  final String message;
  final String? devMessage;
  final ProfileData data;

  Profile(this.status, this.message, this.devMessage, this.data);

  Profile.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        devMessage = json['devMessage'],
        data = ProfileData.formJson(json['data']);
}

class ProfileData {
  final int id;
  final String username;
  final String nickname;
  final String email;
  final String avatar;
  final String description;
  final String mfaType;
  final int createTime;
  final int updateTime;

  ProfileData(
      this.id,
      this.username,
      this.nickname,
      this.email,
      this.avatar,
      this.description,
      this.mfaType,
      this.createTime,
      this.updateTime
  );

  ProfileData.formJson(Map<String, dynamic> json)
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
  static getProfile() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final _hostLink = sp.getString('HOST_LINK');
    final _accessKey = sp.getString('ACCESS_KEY');

    final response = await http.get(
        Uri.parse(_hostLink! + 'content/users/profile'),
        headers: { 'API-Authorization': _accessKey! }
    );

    final Map<String, dynamic> responseBody = await jsonDecode(response.body);

    var profile = Profile.fromJson(responseBody);

    print(_hostLink + '###' + _accessKey);
    print(response.body);
    print(responseBody['message']);
    print(profile.data.avatar);
  }
}