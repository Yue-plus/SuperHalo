import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isShowSidebar = true;

  @override
  Widget build(BuildContext context) {
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
          Visibility(
            visible: _isShowSidebar,
            child: Drawer(
              child: ListView(
                children: const [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    accountName: Text('Yue_plus'),
                    accountEmail: Text('Yue_plus@foxmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('首页'),
                  ),
                  ListTile(
                    leading: Icon(Icons.archive),
                    title: Text('文章归档'),
                  ),
                  ListTile(
                    leading: Icon(Icons.category),
                    title: Text('默认分类'),
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('关于'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('设置'),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Center(child: Text('data')),
          ),
        ],
      ),
    );
  }
}
