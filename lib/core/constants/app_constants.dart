class AppConstants {
  AppConstants._();

  static const String appName = 'TLDR News';
  static const String appTagline = 'Tech news, simplified.';

  // TLDR Newsletter API/Feed endpoints
  static const String baseUrl = 'https://tldr.tech';
  static const String apiBaseUrl = 'https://tldr.tech/api/v1';

  // Storage keys
  static const String themeKey = 'theme_mode';
  static const String bookmarksKey = 'bookmarks';
  static const String lastFetchKey = 'last_fetch';
  static const String selectedCategoriesKey = 'selected_categories';
  static const String readArticlesKey = 'read_articles';
  static const String fontSizeKey = 'font_size';

  // Pagination
  static const int articlesPerPage = 20;

  // Cache duration
  static const Duration cacheDuration = Duration(minutes: 30);

  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 350);
  static const Duration longAnimation = Duration(milliseconds: 500);
}
