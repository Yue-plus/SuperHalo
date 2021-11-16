import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_halo/halo_api/content/user_controller.dart';

/// 检查登入状态
Future _checkBaseInfo(BuildContext context) async {
  final sp = await SharedPreferences.getInstance();
  final hostLink = sp.getString('HOST_LINK');
  final accessKey = sp.getString('ACCESS_KEY');

  if (hostLink == null && accessKey == null) {
    Navigator.pushNamed(context, '/login');
  }
}

class Tourist extends StatefulWidget {
  const Tourist({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  late Future<BloggerProfile?> bloggerProfile;

  @override
  void initState() {
    super.initState();
    _checkBaseInfo(context);

    bloggerProfile = UserController.getsBloggerProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SuperHalo')),
      drawer: const Drawer(
        child: Text('data'),
      ),
      body: Center(
        child: FutureBuilder<BloggerProfile?>(
          future: bloggerProfile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.username);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Text('loading...');
          },
        ),
      )
    );
  }
}