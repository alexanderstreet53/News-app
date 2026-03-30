import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/video.dart';
import 'package:tldr_news/providers/video_provider.dart';
import 'package:tldr_news/screens/videos/widgets/channel_selector.dart';
import 'package:tldr_news/screens/videos/widgets/video_card.dart';
import 'package:tldr_news/widgets/shimmer_loading.dart';

class VideosScreen extends ConsumerWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videosAsync = ref.watch(videosProvider);
    final selectedChannel = ref.watch(selectedChannelProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6B6B), Color(0xFFEE5A24)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('Watch', style: theme.appBarTheme.titleTextStyle),
                ],
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(52),
                child: ChannelSelector(),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: () async => ref.invalidate(videosProvider),
          child: videosAsync.when(
            data: (videos) {
              if (videos.isEmpty) {
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
                        child: Icon(Icons.videocam_off_outlined,
                            size: 32, color: Colors.grey.shade400),
                      ),
                      const SizedBox(height: 14),
                      Text('No videos found',
                          style: theme.textTheme.titleMedium),
                    ],
                  ),
                );
              }

              return CustomScrollView(
                slivers: [
                  if (selectedChannel != null)
                    SliverToBoxAdapter(
                      child: _ChannelHeader(channel: selectedChannel),
                    ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => VideoCard(video: videos[index]),
                      childCount: videos.length,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
                ],
              );
            },
            loading: () => const ShimmerArticleList(),
            error: (error, _) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.wifi_off_rounded,
                      size: 56, color: Colors.grey.shade400),
                  const SizedBox(height: 14),
                  Text('Couldn\'t load videos',
                      style: theme.textTheme.titleMedium),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChannelHeader extends StatelessWidget {
  final TldrChannel channel;

  const _ChannelHeader({required this.channel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            channel.color,
            channel.color.withOpacity(0.7),
            channel.accentColor.withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: channel.color.withOpacity(0.3),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(channel.icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channel.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  channel.description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              channel.youtubeHandle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
