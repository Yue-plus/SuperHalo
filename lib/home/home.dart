import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isShowSidebar = false;

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
            child: const Drawer(
              child: Expanded(child: Center(child: Text('data'))),
            ),
            visible: _isShowSidebar,
          ),
          const Expanded(child: Center(child: Text('data'))),
        ],
      ),
    );
  }
}
