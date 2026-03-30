import 'package:flutter/material.dart';
import 'package:tldr_news/core/utils/date_formatter.dart';

class NewsletterHeader extends StatelessWidget {
  final DateTime date;

  const NewsletterHeader({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6C5CE7).withOpacity(isDark ? 0.2 : 0.1),
                  const Color(0xFF6C5CE7).withOpacity(isDark ? 0.08 : 0.04),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF6C5CE7).withOpacity(isDark ? 0.15 : 0.1),
              ),
            ),
            child: Text(
              DateFormatter.newsletterDate(date),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF6C5CE7),
                letterSpacing: 0.3,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            DateFormatter.fullDate(date),
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
