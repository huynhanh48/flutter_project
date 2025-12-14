import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class AuthService {
  static Future<User?> login(String username, String password) async {
    final res = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    }
    return null;
  }
}
