import 'package:flutter/material.dart';
import 'welcome/welcome.dart';
// import 'package:super_halo/tourist/tourist.dart';
import 'package:super_halo/home/home.dart';

void main() {
  return runApp(
    MaterialApp(
      title: 'SuperHalo',
      home: const Home(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const Welcome(),
      },
    )
  );
}