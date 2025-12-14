import 'dart:convert';
import 'package:flutter_application_4/api/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const String url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=2326ac42708040b4ab50cd34dceda365';

  static Future<List<News>> fetchNews() async {
    final res = await http.get(Uri.parse(url));
    final data = json.decode(res.body);

    List list = data['articles'];
    return list.map((e) => News.fromJson(e)).toList();
  }
}
