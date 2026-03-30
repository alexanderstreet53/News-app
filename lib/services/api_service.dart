import 'package:tldr_news/models/article.dart';
import 'package:tldr_news/models/category.dart';
import 'package:tldr_news/services/mock_data.dart';

/// Service for fetching TLDR newsletter content.
///
/// Currently uses curated mock data that mirrors real TLDR newsletter format.
/// To connect to a live API or RSS feed, replace the mock calls with HTTP
/// requests (the `http` package is already in pubspec.yaml).
class ApiService {
  Future<List<Article>> fetchArticles({
    NewsCategory category = NewsCategory.all,
    int page = 1,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    final allArticles = MockData.generateArticles();

    if (category == NewsCategory.all) {
      return allArticles;
    }

    return allArticles.where((a) => a.category == category).toList();
  }

  Future<Newsletter> fetchNewsletter({
    required NewsCategory category,
    DateTime? date,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final articles = MockData.generateArticles()
        .where((a) =>
            category == NewsCategory.all || a.category == category)
        .toList();

    return Newsletter(
      date: date ?? DateTime.now(),
      category: category,
      articles: articles,
    );
  }

  Future<List<Article>> searchArticles(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final allArticles = MockData.generateArticles();
    final lowerQuery = query.toLowerCase();

    return allArticles.where((a) {
      return a.title.toLowerCase().contains(lowerQuery) ||
          a.summary.toLowerCase().contains(lowerQuery) ||
          a.source.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
