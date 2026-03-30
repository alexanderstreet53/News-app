import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/article.dart';
import 'package:tldr_news/models/category.dart';
import 'package:tldr_news/providers/category_provider.dart';
import 'package:tldr_news/providers/service_providers.dart';

/// Fetches articles for the currently selected category.
final articlesProvider =
    FutureProvider.autoDispose<List<Article>>((ref) async {
  final category = ref.watch(selectedCategoryProvider);
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchArticles(category: category);
});

/// Fetches the newsletter grouped by section.
final newsletterProvider =
    FutureProvider.autoDispose<Newsletter>((ref) async {
  final category = ref.watch(selectedCategoryProvider);
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchNewsletter(category: category);
});

/// Search query state.
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Search results.
final searchResultsProvider =
    FutureProvider.autoDispose<List<Article>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];

  final apiService = ref.read(apiServiceProvider);
  return apiService.searchArticles(query);
});
