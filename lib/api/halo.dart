import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Halo {
  late final int status;
  late final String message;
  late final String? devMessage;
  late final Map data;

  Halo(this.status, this.message, this.devMessage, this.data);

  Halo.formLink(String _link) {
    // 获取基本信息
    Future<SharedPreferences> sp = SharedPreferences.getInstance();
    sp.then((sp) {
      final hostLink = sp.getString('HOST_LINK')!;
      final accessKey = sp.getString('ACCESS_KEY')!;

      // 发送请求
      Future<http.Response> response = http.get(
          Uri.parse(hostLink + _link),
          headers: { 'API-Authorization': accessKey }
      );
      response.then((response) {
        status = response.statusCode;

        // JSON 序列化
        var responseBody = jsonDecode(response.body);
        message = responseBody['message'];
        devMessage = responseBody['devMessage'];
        data = responseBody['data'];

        // return Halo(
        //     response.statusCode,
        //     responseBody['message'],
        //     responseBody['devMessage'],
        //     responseBody['data']
        // );
      });
    });
  }
}