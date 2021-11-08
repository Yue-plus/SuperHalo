import 'package:flutter/material.dart';

class Tourist extends StatelessWidget {
  const Tourist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '添加 Halo 主机：',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '主机链接',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Access Key',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: null,
                child: Text(
                  "LINK START!",
                  style: TextStyle(
                    fontSize: 23
                  ),
                )
              )
            ]
        ),
      ),
    );
  }
}