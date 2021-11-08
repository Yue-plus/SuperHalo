import 'package:flutter/material.dart';
import 'package:super_halo/welcome/manager.dart';
import 'tourist.dart';
import 'manager.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "SuperHalo!",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 46,
            decoration: TextDecoration.none
          )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Tourist())
              );
            },
            child: const Text("只是看看", style: TextStyle(fontSize: 38))
          )
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Manager())
            );
          },
          child: const Text("管理内容", style: TextStyle(fontSize: 38))
        )
      ]
    );
  }
}
