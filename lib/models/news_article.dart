class NewArticle {
  final String title;
  final String description;
  final String publishedAt;
  final String urlImagen;
  final String content;


  NewArticle({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.urlImagen,
    required this.content
  });

  factory NewArticle.fromJson(Map<String, dynamic> json) {
    return NewArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      urlImagen: json['urlToImage'] ?? '', 
      content: json['content'] ?? '',
    );
  }
}
