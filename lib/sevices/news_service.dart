import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_model.dart'; // Import the News model

class NewsService {
  final String _apiKey = 'YOUR_API_KEY_HERE';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  // Fetching the latest news
  Future<List<News>> fetchNews(String category) async {
    final url = Uri.parse('$_baseUrl?category=$category&apiKey=$_apiKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<News> newsList = [];
        for (var article in data['articles']) {
          newsList.add(
              News.fromJson(article)); // Convert each article to a News object
        }
        return newsList;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
