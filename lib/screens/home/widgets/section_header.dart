import 'package:flutter/material.dart';
import 'package:tldr_news/models/article.dart';

class SectionHeader extends StatelessWidget {
  final ArticleSection section;
  final int articleCount;

  const SectionHeader({
    super.key,
    required this.section,
    required this.articleCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Row(
        children: [
          Text(
            section.emoji,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.label,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '$articleCount ${articleCount == 1 ? 'article' : 'articles'}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
