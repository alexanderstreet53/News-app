import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/category.dart';
import 'package:tldr_news/providers/category_provider.dart';

class CategoryChips extends ConsumerWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedCategoryProvider);
    final theme = Theme.of(context);

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: NewsCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = NewsCategory.values[index];
          final isSelected = category == selected;

          return FilterChip(
            selected: isSelected,
            showCheckmark: false,
            avatar: Icon(
              category.icon,
              size: 16,
              color: isSelected ? Colors.white : category.color,
            ),
            label: Text(
              category.label,
              style: TextStyle(
                color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 13,
              ),
            ),
            backgroundColor: theme.colorScheme.surface,
            selectedColor: category.color,
            side: BorderSide(
              color: isSelected ? Colors.transparent : Colors.grey.shade300,
            ),
            onSelected: (_) {
              ref.read(selectedCategoryProvider.notifier).state = category;
            },
          );
        },
      ),
    );
  }
}
