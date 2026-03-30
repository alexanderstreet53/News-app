import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tldr_news/core/constants/app_constants.dart';
import 'package:tldr_news/models/article.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  // Theme
  Future<void> setThemeMode(String mode) async {
    await _prefs.setString(AppConstants.themeKey, mode);
  }

  String getThemeMode() {
    return _prefs.getString(AppConstants.themeKey) ?? 'system';
  }

  // Bookmarks
  Future<void> saveBookmarks(List<Article> articles) async {
    final jsonList = articles.map((a) => jsonEncode(a.toJson())).toList();
    await _prefs.setStringList(AppConstants.bookmarksKey, jsonList);
  }

  List<Article> getBookmarks() {
    final jsonList = _prefs.getStringList(AppConstants.bookmarksKey) ?? [];
    return jsonList
        .map((json) => Article.fromJson(jsonDecode(json) as Map<String, dynamic>))
        .toList();
  }

  Future<void> addBookmark(Article article) async {
    final bookmarks = getBookmarks();
    if (!bookmarks.any((a) => a.id == article.id)) {
      bookmarks.insert(0, article);
      await saveBookmarks(bookmarks);
    }
  }

  Future<void> removeBookmark(String articleId) async {
    final bookmarks = getBookmarks();
    bookmarks.removeWhere((a) => a.id == articleId);
    await saveBookmarks(bookmarks);
  }

  bool isBookmarked(String articleId) {
    return getBookmarks().any((a) => a.id == articleId);
  }

  // Read articles
  Future<void> markAsRead(String articleId) async {
    final readIds = _prefs.getStringList(AppConstants.readArticlesKey) ?? [];
    if (!readIds.contains(articleId)) {
      readIds.add(articleId);
      await _prefs.setStringList(AppConstants.readArticlesKey, readIds);
    }
  }

  bool isRead(String articleId) {
    final readIds = _prefs.getStringList(AppConstants.readArticlesKey) ?? [];
    return readIds.contains(articleId);
  }

  // Font size
  Future<void> setFontSize(double size) async {
    await _prefs.setDouble(AppConstants.fontSizeKey, size);
  }

  double getFontSize() {
    return _prefs.getDouble(AppConstants.fontSizeKey) ?? 14.0;
  }

  // Cache management
  Future<void> setLastFetchTime(DateTime time) async {
    await _prefs.setString(AppConstants.lastFetchKey, time.toIso8601String());
  }

  DateTime? getLastFetchTime() {
    final str = _prefs.getString(AppConstants.lastFetchKey);
    return str != null ? DateTime.parse(str) : null;
  }

  bool isCacheExpired() {
    final lastFetch = getLastFetchTime();
    if (lastFetch == null) return true;
    return DateTime.now().difference(lastFetch) > AppConstants.cacheDuration;
  }
}
