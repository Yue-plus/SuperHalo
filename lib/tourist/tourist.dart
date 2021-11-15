import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tourist extends StatefulWidget {
  const Tourist({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SuperHalo')),
      drawer: const Drawer(
        child: Text('data'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    () async {
      final sp = await SharedPreferences.getInstance();
      final hostLink = sp.getString('HOST_LINK');
      final accessKey = sp.getString('ACCESS_KEY');

      print('asdasdasda');

      if (hostLink == null && accessKey == null) {
        Navigator.pushNamed(context, '/login');
      }
    };
    // TODO: 检查登入状态
  }
}