import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_halo/api/content/users.dart';

class Tourist extends StatefulWidget {
  const Tourist({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  final _hostLink = TextEditingController(text: 'http://localhost:8090/api/');
  final _accessKey = TextEditingController(text: '123');

  _validatorHostLink(String? value) {
    // TODO: 验证 URL 合法性
    return null;
  }

  void _linkStart() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('HOST_LINK', _hostLink.text);
    await sp.setString('ACCESS_KEY', _accessKey.text);
    Users.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 800,
          height: 800,
          padding: const EdgeInsets.all(8),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '添加 Halo 主机：',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _hostLink,
                  validator: (v) => _validatorHostLink(v),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '主机 API 链接',
                    hintText: 'http(s)://example.com:8090/api/'
                  )
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _accessKey,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Access Key',
                  ),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  onPressed: _linkStart,
                  child: const Text(
                    "LINK START!",
                    style: TextStyle(
                      fontSize: 23
                    ),
                  )
                )
              ]
            )
          ),
        ),
      ),
    );
  }
}