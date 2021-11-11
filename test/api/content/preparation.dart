import 'package:shared_preferences/shared_preferences.dart';

Future<void> preparation() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  await sp.setString('HOST_LINK', 'http://localhost:8090/api/');
  await sp.setString('ACCESS_KEY', '123');
}