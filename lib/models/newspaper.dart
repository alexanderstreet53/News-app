import 'package:flutter/material.dart';

class NewspaperIssue {
  final String id;
  final String title;
  final String subtitle;
  final DateTime publishedAt;
  final String coverGradientStart;
  final String coverGradientEnd;
  final List<NewspaperArticle> articles;
  final int readTimeMinutes;

  const NewspaperIssue({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.publishedAt,
    required this.coverGradientStart,
    required this.coverGradientEnd,
    required this.articles,
    required this.readTimeMinutes,
  });
}

class NewspaperArticle {
  final String id;
  final String title;
  final String content;
  final String author;
  final String category;
  final int readTimeMinutes;
  final bool isPremium;

  const NewspaperArticle({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.category,
    this.readTimeMinutes = 5,
    this.isPremium = true,
  });
}

class MockNewspaperData {
  MockNewspaperData._();

  static List<NewspaperIssue> getIssues() {
    final now = DateTime.now();
    return [
      NewspaperIssue(
        id: 'issue-30',
        title: 'Too Long; Did Read',
        subtitle: 'Issue #30 — The AI Infrastructure Edition',
        publishedAt: now,
        coverGradientStart: '0xFF0F3460',
        coverGradientEnd: '0xFF5B8DEF',
        readTimeMinutes: 42,
        articles: [
          const NewspaperArticle(
            id: 'np-1',
            title: 'The Hidden Cost of AI Infrastructure',
            content:
                'As companies race to deploy AI at scale, the true cost of the underlying '
                'infrastructure is becoming clear. Data centers are consuming unprecedented '
                'amounts of energy, water usage for cooling is straining local resources, '
                'and the demand for specialized GPUs has created a global supply chain '
                'bottleneck.\n\n'
                'In this deep dive, we examine the environmental, economic, and geopolitical '
                'implications of building the AI future. From the power plants being '
                'reactivated to feed data center demand, to the new chip fabs being '
                'constructed across three continents, the story of AI infrastructure is '
                'really a story about how we allocate our most precious resources.\n\n'
                'Industry experts estimate that AI-related energy consumption will triple '
                'by 2028, raising questions about sustainability commitments made by '
                'major tech companies. Microsoft, Google, and Amazon have all seen their '
                'carbon emissions rise despite aggressive renewable energy investments.',
            author: 'Sarah Chen',
            category: 'Deep Dive',
            readTimeMinutes: 12,
          ),
          const NewspaperArticle(
            id: 'np-2',
            title: 'Inside the Race to Build Quantum-Resistant Encryption',
            content:
                'With quantum computers advancing rapidly, cryptographers are in a sprint '
                'to deploy quantum-resistant algorithms before existing encryption becomes '
                'vulnerable. NIST has finalized its first post-quantum standards, but '
                'the real challenge is migration.\n\n'
                'Banks, governments, and tech companies face the massive task of updating '
                'billions of devices and systems. Some organizations have adopted a '
                '"harvest now, decrypt later" defense posture, assuming adversaries '
                'are already collecting encrypted data for future decryption.\n\n'
                'We speak with leading cryptographers about the timeline, the risks of '
                'moving too slowly, and why this might be the largest coordinated '
                'technology migration in history.',
            author: 'Marcus Webb',
            category: 'Security',
            readTimeMinutes: 10,
          ),
          const NewspaperArticle(
            id: 'np-3',
            title: 'The Developer Productivity Paradox',
            content:
                'AI coding assistants promise massive productivity gains, yet many '
                'engineering teams report that output metrics have barely moved. What\'s '
                'going on?\n\n'
                'We surveyed 2,000 developers and found a nuanced picture: while '
                'individual coding speed has increased dramatically, the complexity of '
                'tasks has grown in parallel. Developers are tackling problems they '
                'wouldn\'t have attempted before, shipping features that once seemed '
                'impractical.\n\n'
                'The paradox reveals something important about how we measure productivity. '
                'Lines of code, tickets closed, and PR velocity all fail to capture the '
                'qualitative shift in what developers are building.',
            author: 'Priya Patel',
            category: 'Opinion',
            readTimeMinutes: 8,
          ),
          const NewspaperArticle(
            id: 'np-4',
            title: 'Africa\'s Silicon Savannah Is Growing Up',
            content:
                'Kenya\'s tech ecosystem has matured far beyond its "Silicon Savannah" '
                'nickname. With \$1.2B in venture funding last year and several companies '
                'reaching unicorn status, East Africa is becoming a serious player in '
                'the global tech landscape.\n\n'
                'We profile three Nairobi-based startups that are solving uniquely '
                'African problems with global potential: a logistics platform that '
                'routes around infrastructure gaps, an agricultural AI that helps '
                'smallholder farmers, and a fintech serving the unbanked.\n\n'
                'The common thread? Each company understood that copying Silicon Valley '
                'playbooks wouldn\'t work — instead, they innovated from constraints.',
            author: 'James Mwangi',
            category: 'Startups',
            readTimeMinutes: 12,
          ),
        ],
      ),
      NewspaperIssue(
        id: 'issue-29',
        title: 'Too Long; Did Read',
        subtitle: 'Issue #29 — The Open Source Revolution',
        publishedAt: now.subtract(const Duration(days: 7)),
        coverGradientStart: '0xFF6A1B9A',
        coverGradientEnd: '0xFFCE93D8',
        readTimeMinutes: 38,
        articles: [
          const NewspaperArticle(
            id: 'np-5',
            title: 'Open Source AI: A New Power Balance',
            content:
                'Meta\'s decision to open-source Llama has fundamentally altered the AI '
                'landscape. We explore how open-source models are democratizing AI and '
                'challenging the closed-model approach of OpenAI and Google.',
            author: 'Dan Li',
            category: 'Analysis',
            readTimeMinutes: 10,
          ),
          const NewspaperArticle(
            id: 'np-6',
            title: 'The Maintainer Crisis Nobody Talks About',
            content:
                'Critical open-source infrastructure is maintained by a handful of '
                'unpaid volunteers. We investigate the systemic risks and emerging '
                'solutions, from corporate sponsorship to government funding.',
            author: 'Anna Kowalski',
            category: 'Investigation',
            readTimeMinutes: 14,
          ),
        ],
      ),
      NewspaperIssue(
        id: 'issue-28',
        title: 'Too Long; Did Read',
        subtitle: 'Issue #28 — The Climate Tech Surge',
        publishedAt: now.subtract(const Duration(days: 14)),
        coverGradientStart: '0xFF1B5E20',
        coverGradientEnd: '0xFF81C784',
        readTimeMinutes: 35,
        articles: [
          const NewspaperArticle(
            id: 'np-7',
            title: 'Carbon Capture Tech Finally Makes Economic Sense',
            content:
                'New breakthroughs in direct air capture are bringing costs down to '
                'levels that make commercial deployment viable. We visit the world\'s '
                'largest DAC facility and explore what this means for climate targets.',
            author: 'Elena Rodriguez',
            category: 'Climate',
            readTimeMinutes: 11,
          ),
        ],
      ),
    ];
  }
}
