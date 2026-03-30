import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/video.dart';
import 'package:tldr_news/providers/video_provider.dart';

class ChannelSelector extends ConsumerWidget {
  const ChannelSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedChannelProvider);
    final theme = Theme.of(context);

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: TldrChannel.values.length + 1, // +1 for "All"
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            final isSelected = selected == null;
            return FilterChip(
              selected: isSelected,
              showCheckmark: false,
              avatar: Icon(
                Icons.play_circle_outline,
                size: 16,
                color: isSelected ? Colors.white : theme.colorScheme.primary,
              ),
              label: Text(
                'All',
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : theme.colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              backgroundColor: theme.colorScheme.surface,
              selectedColor: theme.colorScheme.primary,
              side: BorderSide(
                color:
                    isSelected ? Colors.transparent : Colors.grey.shade300,
              ),
              onSelected: (_) {
                ref.read(selectedChannelProvider.notifier).state = null;
              },
            );
          }

          final channel = TldrChannel.values[index - 1];
          final isSelected = channel == selected;

          return FilterChip(
            selected: isSelected,
            showCheckmark: false,
            avatar: Icon(
              channel.icon,
              size: 16,
              color: isSelected ? Colors.white : channel.color,
            ),
            label: Text(
              channel.label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 13,
              ),
            ),
            backgroundColor: theme.colorScheme.surface,
            selectedColor: channel.color,
            side: BorderSide(
              color: isSelected ? Colors.transparent : Colors.grey.shade300,
            ),
            onSelected: (_) {
              ref.read(selectedChannelProvider.notifier).state = channel;
            },
          );
        },
      ),
    );
  }
}
