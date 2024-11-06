import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/news_article.dart';

class NewsRepository {
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  final String apiKeyNews = dotenv.env['API_KEY_NEWS'] ?? '';


  Future<List<NewArticle>> getNews({int page = 1}) async {
    final url = Uri.parse('$baseUrl/top-headlines?country=us&page=$page&apiKey=$apiKeyNews');
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final data = jsonDecode(result.body);
      List<dynamic> articulosJson = data['articles'];
      return articulosJson.map((json) => NewArticle.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar noticias');
    }
  }
}
