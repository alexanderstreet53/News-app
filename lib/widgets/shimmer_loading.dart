import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerArticleList extends StatelessWidget {
  const ShimmerArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? const Color(0xFF1A1D35) : const Color(0xFFEEEEF2);
    final highlightColor =
        isDark ? const Color(0xFF222545) : const Color(0xFFF8F8FB);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Hero shimmer
          Container(
            height: 220,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          // Compact cards
          for (var i = 0; i < 5; i++) ...[
            Container(
              height: 100,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
