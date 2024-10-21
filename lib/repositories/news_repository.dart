import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_article.dart';

class NewsRepository {
  final String baseUrl = 'https://newsapi.org/v2';  // URL base de la API
  final String apiKey = '8119c35f08ff44e687059cdd745b5888'; 


  Future<List<NewArticle>> getNews({int page = 1}) async {
    final url = Uri.parse('$baseUrl/top-headlines?country=us&page=$page&apiKey=$apiKey');
    
    final result = await http.get(url);
    print("getNews_statusCode: ${result.statusCode}");
    if (result.statusCode == 200) {
      final data = jsonDecode(result.body);
      List<dynamic> articulosJson = data['articles'];
      return articulosJson.map((json) => NewArticle.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar noticias');
    }
  }
}
