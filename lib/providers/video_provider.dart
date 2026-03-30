import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/video.dart';
import 'package:tldr_news/services/mock_video_data.dart';

final selectedChannelProvider =
    StateProvider<TldrChannel?>((ref) => null); // null = all channels

final videosProvider =
    FutureProvider.autoDispose<List<Video>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 600));
  final channel = ref.watch(selectedChannelProvider);
  final allVideos = MockVideoData.generateVideos();

  if (channel == null) return allVideos;
  return allVideos.where((v) => v.channel == channel).toList();
});
