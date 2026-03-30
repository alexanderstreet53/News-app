import 'package:tldr_news/models/category.dart';

class Article {
  final String id;
  final String title;
  final String summary;
  final String url;
  final String? imageUrl;
  final String source;
  final NewsCategory category;
  final ArticleSection section;
  final DateTime publishedAt;
  final int readTimeMinutes;

  const Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.url,
    this.imageUrl,
    required this.source,
    required this.category,
    required this.section,
    required this.publishedAt,
    this.readTimeMinutes = 1,
  });

  Article copyWith({
    String? id,
    String? title,
    String? summary,
    String? url,
    String? imageUrl,
    String? source,
    NewsCategory? category,
    ArticleSection? section,
    DateTime? publishedAt,
    int? readTimeMinutes,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      source: source ?? this.source,
      category: category ?? this.category,
      section: section ?? this.section,
      publishedAt: publishedAt ?? this.publishedAt,
      readTimeMinutes: readTimeMinutes ?? this.readTimeMinutes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'url': url,
      'imageUrl': imageUrl,
      'source': source,
      'category': category.slug,
      'section': section.name,
      'publishedAt': publishedAt.toIso8601String(),
      'readTimeMinutes': readTimeMinutes,
    };
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      url: json['url'] as String,
      imageUrl: json['imageUrl'] as String?,
      source: json['source'] as String,
      category: NewsCategory.values.firstWhere(
        (c) => c.slug == json['category'],
        orElse: () => NewsCategory.tech,
      ),
      section: ArticleSection.values.firstWhere(
        (s) => s.name == json['section'],
        orElse: () => ArticleSection.headlines,
      ),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      readTimeMinutes: json['readTimeMinutes'] as int? ?? 1,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Article && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

enum ArticleSection {
  headlines('Headlines', '📰'),
  bigTech('Big Tech & Startups', '🏢'),
  scienceAndFuturisticTech('Science & Futuristic Technology', '🔬'),
  programmingAndDev('Programming & Dev', '💻'),
  miscellaneous('Miscellaneous', '📌'),
  quickLinks('Quick Links', '🔗'),
  launches('Launches & Tools', '🚀'),
  opinions('Opinions & Tutorials', '📝'),
  sponsored('Sponsor', '⭐');

  const ArticleSection(this.label, this.emoji);

  final String label;
  final String emoji;
}

class Newsletter {
  final DateTime date;
  final NewsCategory category;
  final List<Article> articles;

  const Newsletter({
    required this.date,
    required this.category,
    required this.articles,
  });

  Map<ArticleSection, List<Article>> get groupedBySection {
    final grouped = <ArticleSection, List<Article>>{};
    for (final article in articles) {
      grouped.putIfAbsent(article.section, () => []).add(article);
    }
    return grouped;
  }
}
