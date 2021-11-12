import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome/welcome.dart';
import 'package:super_halo/tourist/tourist.dart';

void main() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  final hostLink = sp.getString('HOST_LINK');
  final accessKey = sp.getString('ACCESS_KEY');

  if (hostLink != null && accessKey != null) {
    return runApp(const MaterialApp(title: 'SuperHalo', home: Tourist()));
  } else {
    return runApp(const MaterialApp(title: '连接到 Halo 主机', home: Welcome()));
  }
}