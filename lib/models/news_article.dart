class NewArticle {
  final String title;
  final String description;
  final String url;
  final String urlImagen;

  NewArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlImagen,
  });

  factory NewArticle.fromJson(Map<String, dynamic> json) {
    return NewArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlImagen: json['urlToImage'] ?? '',
    );
  }
}
