import 'package:flutter/material.dart';

/// Represents each TLDR YouTube channel by region/topic.
enum TldrChannel {
  global(
    label: 'TLDR',
    slug: 'global',
    color: Color(0xFF0F3460),
    accentColor: Color(0xFF5B8DEF),
    icon: Icons.public,
    youtubeHandle: '@TLDRGlobal',
    description: 'Byte-sized news for techies',
  ),
  uk(
    label: 'TLDR UK',
    slug: 'uk',
    color: Color(0xFF1B3A7B),
    accentColor: Color(0xFF4A90D9),
    icon: Icons.flag,
    youtubeHandle: '@TLDRUK',
    description: 'UK news, explained simply',
  ),
  eu(
    label: 'TLDR EU',
    slug: 'eu',
    color: Color(0xFF003399),
    accentColor: Color(0xFFFFCC00),
    icon: Icons.euro,
    youtubeHandle: '@TLDREU',
    description: 'EU news & policy, simplified',
  ),
  us(
    label: 'TLDR US',
    slug: 'us',
    color: Color(0xFF8B0000),
    accentColor: Color(0xFFCD5C5C),
    icon: Icons.flag_circle,
    youtubeHandle: '@TLDRUS',
    description: 'US news & politics, made simple',
  ),
  africa(
    label: 'TLDR Africa',
    slug: 'africa',
    color: Color(0xFF2E7D32),
    accentColor: Color(0xFF66BB6A),
    icon: Icons.travel_explore,
    youtubeHandle: '@TLDRAfrica',
    description: 'African news & development',
  ),
  daily(
    label: 'TLDR Daily',
    slug: 'daily',
    color: Color(0xFFE94560),
    accentColor: Color(0xFFFF7B93),
    icon: Icons.today,
    youtubeHandle: '@TLDRDaily',
    description: 'Daily global news roundup',
  );

  const TldrChannel({
    required this.label,
    required this.slug,
    required this.color,
    required this.accentColor,
    required this.icon,
    required this.youtubeHandle,
    required this.description,
  });

  final String label;
  final String slug;
  final Color color;
  final Color accentColor;
  final IconData icon;
  final String youtubeHandle;
  final String description;
}

class Video {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final TldrChannel channel;
  final Duration duration;
  final DateTime publishedAt;
  final int viewCount;

  const Video({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.channel,
    required this.duration,
    required this.publishedAt,
    this.viewCount = 0,
  });

  String get formattedDuration {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String get formattedViewCount {
    if (viewCount >= 1000000) {
      return '${(viewCount / 1000000).toStringAsFixed(1)}M views';
    } else if (viewCount >= 1000) {
      return '${(viewCount / 1000).toStringAsFixed(1)}K views';
    }
    return '$viewCount views';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'channel': channel.slug,
      'duration': duration.inSeconds,
      'publishedAt': publishedAt.toIso8601String(),
      'viewCount': viewCount,
    };
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      videoUrl: json['videoUrl'] as String,
      channel: TldrChannel.values.firstWhere(
        (c) => c.slug == json['channel'],
        orElse: () => TldrChannel.global,
      ),
      duration: Duration(seconds: json['duration'] as int),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      viewCount: json['viewCount'] as int? ?? 0,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Video && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
