import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetHalo {
  final int status;
  final String message;
  final String? devMessage;
  final Map data;

  GetHalo(this.status, this.message, this.devMessage, this.data);

  static Future<GetHalo> formLink(String link) async {
    // 获取基本信息
    final sp = await SharedPreferences.getInstance();
    final hostLink = sp.getString('HOST_LINK')!;
    final accessKey = sp.getString('ACCESS_KEY')!;

    // 发送 GET 请求
    final response = await http.get(
        Uri.parse(hostLink + link),
        headers: { 'API-Authorization': accessKey }
    );

    // JSON 序列化
    var responseBody = jsonDecode(response.body);
    return GetHalo(
        response.statusCode,
        responseBody['message'],
        responseBody['devMessage'],
        responseBody['data']
    );
  }
}