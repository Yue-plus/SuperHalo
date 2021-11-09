import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Users {
  static getProfile() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final _hostLink = sp.getString('HOST_LINK');
    final _accessKey = sp.getString('ACCESS_KEY');

    return await http.get(
        Uri.parse(_hostLink! + 'content/users/profile'),
        headers: { 'API-Authorization': _accessKey! }
    );
  }
}