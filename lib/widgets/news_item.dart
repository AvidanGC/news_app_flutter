import 'package:flutter/material.dart';

import '../helpers/MediaHelper.dart';
import '/widgets/element/DateTime/date_time_news.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagenUrl;
  final String content;
  final String publishedAt;
  final VoidCallback onTap;

  const NewsItem({
    required this.title,
    required this.description,
    required this.content,
    required this.imagenUrl,
    required this.publishedAt,
    required this.onTap,
  });

 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaHelper.cachedNetworkImage(imagenUrl),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: DateTimeWidgetNews(publishedAt),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}