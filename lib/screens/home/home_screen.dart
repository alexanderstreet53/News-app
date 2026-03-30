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

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'TLDR',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('News'),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: _ArticleSearchDelegate(ref),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border_rounded),
                  tooltip: 'Bookmarks',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const BookmarksScreen(),
                      ),
                    );
                  },
                ),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(56),
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
                return const Center(
                  child: Text('No articles found for this category.'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 100),
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
                    Icon(
                      Icons.wifi_off_rounded,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load articles',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pull down to retry',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
      count += 1; // section header
      count += entry.value.length; // articles
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
    for (final entry in grouped.entries) {
      if (index == cursor) {
        return SectionHeader(
          section: entry.key,
          articleCount: entry.value.length,
        );
      }
      cursor++;

      for (final article in entry.value) {
        if (index == cursor) {
          return ArticleCard(
            article: article,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ArticleDetailScreen(article: article),
                ),
              );
            },
          );
        }
        cursor++;
      }
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
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
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
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(
              'Search articles by title, summary, or source',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ArticleCard(
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
