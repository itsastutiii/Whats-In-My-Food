class News {
  final String title;
  final String description;
  final String url;
  final String image;

  News({
    required this.title,
    required this.description,
    required this.url,
    required this.image,
  });

  // Factory method to create a News object from a map (JSON)
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      image: json['urlToImage'] ?? '', // Default to empty string if no image
    );
  }
}
