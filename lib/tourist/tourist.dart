import 'package:flutter/material.dart';

class Tourist extends StatelessWidget {
  const Tourist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SuperHalo'),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 24.0,
          semanticLabel: '菜单',
        )
      )
    );
  }
}