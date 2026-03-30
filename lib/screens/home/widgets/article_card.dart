import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/core/utils/date_formatter.dart';
import 'package:tldr_news/core/utils/url_helper.dart';
import 'package:tldr_news/models/article.dart';
import 'package:tldr_news/providers/bookmarks_provider.dart';

class ArticleCard extends ConsumerWidget {
  final Article article;
  final VoidCallback? onTap;

  const ArticleCard({
    super.key,
    required this.article,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isBookmarked = ref.watch(
      bookmarksProvider.select((list) => list.any((a) => a.id == article.id)),
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category & time row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: article.category.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          article.category.icon,
                          size: 12,
                          color: article.category.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          article.category.label,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: article.category.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${article.readTimeMinutes} min read',
                    style: theme.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    DateFormatter.relative(article.publishedAt),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Title
              Text(
                article.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // Summary
              Text(
                article.summary,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),

              // Source & actions row
              Row(
                children: [
                  Icon(
                    Icons.public,
                    size: 14,
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      article.source,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Bookmark button
                  _ActionButton(
                    icon: isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: isBookmarked
                        ? theme.colorScheme.secondary
                        : null,
                    onTap: () {
                      ref.read(bookmarksProvider.notifier).toggle(article);
                    },
                  ),
                  const SizedBox(width: 4),
                  // Share button
                  _ActionButton(
                    icon: Icons.share_outlined,
                    onTap: () {
                      UrlHelper.shareArticle(
                        title: article.title,
                        url: article.url,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 20,
            color: color ??
                Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
