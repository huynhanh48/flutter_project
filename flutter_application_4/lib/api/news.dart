class News {
  final String title;
  final String description;
  final String image;
  final String content;

  News({
    required this.title,
    required this.description,
    required this.image,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['urlToImage'] ?? 'https://via.placeholder.com/400x200',
      content: json['content'] ?? '',
    );
  }
}
