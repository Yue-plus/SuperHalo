import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetRequest {
  final int status;
  final String message;
  final String? devMessage;
  final String data;

  GetRequest(this.status, this.message, this.devMessage, this.data);

  static Future<GetRequest?> formLink(String link,
      [BuildContext? context]) async {
    // 获取基本信息
    final sp = await SharedPreferences.getInstance();
    final hostLink = sp.getString('HOST_LINK')!;
    final accessKey = sp.getString('ACCESS_KEY')!;
    final adminKey = sp.getString('ADMIN_KEY');
    final Map<String, String>? key;

    // 优先使用 adminKey
    adminKey != null
        ? key = {'ADMIN-Authorization': adminKey}
        : key = {'API-Authorization': accessKey};

    try {
      // 发送 GET 请求
      final response = await http.get(Uri.parse(hostLink + link), headers: key);
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return GetRequest(response.statusCode, responseBody['message'],
            responseBody['devMessage'], jsonEncode(responseBody['data']));
      } else {
        if (context != null) {
          // TODO: 加个加载动画
          return showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  title: Text(response.statusCode.toString()),
                  content: Text(responseBody['message'])));
        } else {
          return null;
        }
      }
    } catch (e) {
      if (context != null) {
        // TODO: 加个加载动画
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(title: Text(e.toString())));
      } else {
        rethrow;
      }
    }
    return null;
  }
}
