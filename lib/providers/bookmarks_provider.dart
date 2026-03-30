import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/article.dart';
import 'package:tldr_news/providers/service_providers.dart';

final bookmarksProvider =
    StateNotifierProvider<BookmarksNotifier, List<Article>>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return BookmarksNotifier(storage.getBookmarks(), storage);
});

class BookmarksNotifier extends StateNotifier<List<Article>> {
  final dynamic _storage;

  BookmarksNotifier(List<Article> initial, this._storage) : super(initial);

  bool isBookmarked(String articleId) {
    return state.any((a) => a.id == articleId);
  }

  Future<void> toggle(Article article) async {
    if (isBookmarked(article.id)) {
      await _storage.removeBookmark(article.id);
      state = state.where((a) => a.id != article.id).toList();
    } else {
      await _storage.addBookmark(article);
      state = [article, ...state];
    }
  }

  Future<void> remove(String articleId) async {
    await _storage.removeBookmark(articleId);
    state = state.where((a) => a.id != articleId).toList();
  }

  Future<void> clearAll() async {
    await _storage.saveBookmarks(<Article>[]);
    state = [];
  }
}
