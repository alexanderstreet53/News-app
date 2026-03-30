import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/article.dart';
import 'package:tldr_news/providers/articles_provider.dart';
import 'package:tldr_news/screens/article_detail/article_detail_screen.dart';
import 'package:tldr_news/screens/bookmarks/bookmarks_screen.dart';
import 'package:tldr_news/screens/home/widgets/article_card.dart';
import 'package:tldr_news/screens/home/widgets/category_chips.dart';
import 'package:tldr_news/screens/home/widgets/newsletter_header.dart';
import 'package:tldr_news/screens/home/widgets/section_header.dart';
import 'package:tldr_news/widgets/shimmer_loading.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsletterAsync = ref.watch(newsletterProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              toolbarHeight: 56,
              title: Row(
                children: [
                  // TLDR logo — custom, not generic
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C5CE7), Color(0xFFA78BFA)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'TLDR',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'News',
                    style: theme.appBarTheme.titleTextStyle,
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: _ArticleSearchDelegate(ref),
                    );
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.06)
                          : Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      size: 20,
                      color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const BookmarksScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.06)
                          : Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.bookmark_border_rounded,
                      size: 20,
                      color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(52),
                child: CategoryChips(),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(newsletterProvider);
          },
          child: newsletterAsync.when(
            data: (newsletter) {
              final grouped = newsletter.groupedBySection;
              if (grouped.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.inbox_rounded,
                          size: 56, color: Colors.grey.shade400),
                      const SizedBox(height: 12),
                      Text(
                        'Nothing here yet',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 120),
                itemCount: _countItems(grouped),
                itemBuilder: (context, index) {
                  return _buildItem(context, index, newsletter, grouped);
                },
              );
            },
            loading: () => const ShimmerArticleList(),
            error: (error, _) => Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withOpacity(0.06)
                            : Colors.black.withOpacity(0.04),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wifi_off_rounded,
                        size: 32,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Couldn\'t load articles',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 6),
                    Text('Pull down to retry',
                        style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _countItems(Map<ArticleSection, List<Article>> grouped) {
    int count = 1; // newsletter header
    for (final entry in grouped.entries) {
      count += 1 + entry.value.length; // section header + articles
    }
    return count;
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    Newsletter newsletter,
    Map<ArticleSection, List<Article>> grouped,
  ) {
    if (index == 0) {
      return NewsletterHeader(date: newsletter.date);
    }

    int cursor = 1;
    bool isFirstArticleGlobal = true; // first article overall → hero

    for (final entry in grouped.entries) {
      if (index == cursor) {
        return SectionHeader(
          section: entry.key,
          articleCount: entry.value.length,
        );
      }
      cursor++;

      for (int i = 0; i < entry.value.length; i++) {
        if (index == cursor) {
          final article = entry.value[i];
          final navigate = () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ArticleDetailScreen(article: article),
              ),
            );
          };

          // First article of the first section = hero card
          if (isFirstArticleGlobal && i == 0) {
            isFirstArticleGlobal = false;
            return HeroArticleCard(article: article, onTap: navigate);
          }
          isFirstArticleGlobal = false;

          return CompactArticleCard(article: article, onTap: navigate);
        }
        cursor++;
      }
      isFirstArticleGlobal = false;
    }

    return const SizedBox.shrink();
  }
}

class _ArticleSearchDelegate extends SearchDelegate<String> {
  final WidgetRef _ref;
  _ArticleSearchDelegate(this._ref);

  @override
  String get searchFieldLabel => 'Search TLDR articles...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.textTheme.bodyMedium,
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear_rounded),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _ref.read(searchQueryProvider.notifier).state = query;
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 2) {
      final theme = Theme.of(context);
      final isDark = theme.brightness == Brightness.dark;
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.06)
                    : Colors.black.withOpacity(0.04),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search_rounded,
                  size: 32, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 14),
            Text('Search articles', style: theme.textTheme.titleMedium),
          ],
        ),
      );
    }
    _ref.read(searchQueryProvider.notifier).state = query;
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final results = ref.watch(searchResultsProvider);
        return results.when(
          data: (articles) {
            if (articles.isEmpty) {
              return Center(
                child: Text(
                  'No results for "$query"',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 100),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return CompactArticleCard(
                  article: articles[index],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ArticleDetailScreen(
                          article: articles[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        );
      },
    );
  }
}
