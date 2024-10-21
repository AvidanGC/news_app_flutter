import 'package:flutter/material.dart';
import 'package:news_app_flutter/helpers/MediaHelper.dart';

import '../models/news_article.dart';

class NewsDetailPage extends StatelessWidget {
  final NewArticle? news;
  const NewsDetailPage({super.key, this.news});

  @override
  Widget build(BuildContext context) {
    final NewArticle news = ModalRoute.of(context)?.settings.arguments as NewArticle;
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaHelper.cachedNetworkImage(news.urlImagen),
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(news.description),
          ],
        ),
      ),
    );
  }
}
