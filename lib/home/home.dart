import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:super_halo/halo_api/content/user_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isShowSidebar = true;

  late final Future<BloggerProfile?> bloggerProfile;

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            accountName: FutureBuilder<BloggerProfile?>(
              future: bloggerProfile,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.username);
                }
                return const Text('Loading...');
              },
            ),
            accountEmail: const Text('Yue_plus@foxmail.com'),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('首页'),
          ),
          const ListTile(
            leading: Icon(Icons.archive),
            title: Text('文章归档'),
          ),
          const ListTile(
            leading: Icon(Icons.category),
            title: Text('默认分类'),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('关于'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return ListView(
      children: const [
        Card(
          child: ListTile(
            leading: Text('#1'),
            title: Text('[活动预告]主线【风暴瞭望】开放，限时纪念活动开启'),
            subtitle: Text(
                '''一、主线EP09【风暴瞭望】开放**开启时间：**09月17日16:00**解锁条件：**通关主线3-8二、【小丘上的眠柳】限时寻访开启**活动时间：**09月17日 16:00 - 10月01日 03:59**活动说明：**活动期间【小丘上的眠柳】限时寻访开启，该寻访中以下干员出现率上升★★★★★...'''),
            trailing: Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }

  Widget _buildLG(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SuperHalo'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _isShowSidebar = !_isShowSidebar;
            });
          },
        ),
      ),
      body: Row(
        children: [
          Visibility(visible: _isShowSidebar, child: _drawer(context)),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Widget _buildMD(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SuperHalo')),
      drawer: _drawer(context),
      body: _body(),
    );
  }

  /// 临时登入（测试用）
  Future _login() async {
    final sp = await SharedPreferences.getInstance();
    sp.setString('HOST_LINK', 'http://localhost:8090/api/');
    sp.setString('ACCESS_KEY', '123');
  }

  @override
  void initState() {
    super.initState();

    _login();
    bloggerProfile = UserController.getsBloggerProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 700) {
        return _buildLG(context);
      } else {
        return _buildMD(context);
      }
    });
  }
}
