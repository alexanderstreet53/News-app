import 'package:flutter_test/flutter_test.dart';
import 'package:tldr_news/models/article.dart';
import 'package:tldr_news/models/category.dart';

void main() {
  group('Article', () {
    final article = Article(
      id: 'test-1',
      title: 'Test Article',
      summary: 'This is a test summary',
      url: 'https://example.com/test',
      source: 'Test Source',
      category: NewsCategory.tech,
      section: ArticleSection.headlines,
      publishedAt: DateTime(2024, 1, 15),
      readTimeMinutes: 3,
    );

    test('serializes to JSON and back', () {
      final json = article.toJson();
      final restored = Article.fromJson(json);

      expect(restored.id, article.id);
      expect(restored.title, article.title);
      expect(restored.summary, article.summary);
      expect(restored.url, article.url);
      expect(restored.source, article.source);
      expect(restored.category, article.category);
      expect(restored.section, article.section);
      expect(restored.readTimeMinutes, article.readTimeMinutes);
    });

    test('equality is based on id', () {
      final same = article.copyWith(title: 'Different Title');
      expect(article, equals(same));

      final different = article.copyWith(id: 'test-2');
      expect(article, isNot(equals(different)));
    });

    test('copyWith creates modified copy', () {
      final modified = article.copyWith(
        title: 'New Title',
        readTimeMinutes: 5,
      );

      expect(modified.title, 'New Title');
      expect(modified.readTimeMinutes, 5);
      expect(modified.id, article.id);
      expect(modified.summary, article.summary);
    });
  });

  group('Newsletter', () {
    test('groupedBySection organizes articles', () {
      final articles = [
        Article(
          id: '1',
          title: 'Headline 1',
          summary: 'Summary',
          url: 'https://example.com',
          source: 'Source',
          category: NewsCategory.tech,
          section: ArticleSection.headlines,
          publishedAt: DateTime.now(),
        ),
        Article(
          id: '2',
          title: 'Headline 2',
          summary: 'Summary',
          url: 'https://example.com',
          source: 'Source',
          category: NewsCategory.tech,
          section: ArticleSection.headlines,
          publishedAt: DateTime.now(),
        ),
        Article(
          id: '3',
          title: 'Dev Article',
          summary: 'Summary',
          url: 'https://example.com',
          source: 'Source',
          category: NewsCategory.tech,
          section: ArticleSection.programmingAndDev,
          publishedAt: DateTime.now(),
        ),
      ];

      final newsletter = Newsletter(
        date: DateTime.now(),
        category: NewsCategory.tech,
        articles: articles,
      );

      final grouped = newsletter.groupedBySection;
      expect(grouped.keys.length, 2);
      expect(grouped[ArticleSection.headlines]?.length, 2);
      expect(grouped[ArticleSection.programmingAndDev]?.length, 1);
    });
  });

  group('NewsCategory', () {
    test('has all expected categories', () {
      expect(NewsCategory.values.length, 10);
      expect(NewsCategory.values.map((c) => c.slug), containsAll([
        'all', 'tech', 'webdev', 'ai', 'infosec',
        'crypto', 'devops', 'design', 'marketing', 'founders',
      ]));
    });
  });
}
