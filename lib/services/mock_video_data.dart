import 'package:tldr_news/models/video.dart';

class MockVideoData {
  MockVideoData._();

  static List<Video> generateVideos() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final twoDaysAgo = today.subtract(const Duration(days: 2));
    final threeDaysAgo = today.subtract(const Duration(days: 3));
    final fourDaysAgo = today.subtract(const Duration(days: 4));

    return [
      // ── TLDR Global ──────────────────────────────────────
      Video(
        id: 'v-global-1',
        title: 'OpenAI Just Changed Everything With GPT-5',
        description:
            'OpenAI has released GPT-5 and it\'s a massive leap forward. In this video '
            'we break down the new capabilities including real-time video understanding, '
            'improved reasoning, and what it means for developers and businesses. Plus, '
            'we look at the competitive response from Google and Anthropic.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder1/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder1',
        channel: TldrChannel.global,
        duration: const Duration(minutes: 12, seconds: 34),
        publishedAt: today,
        viewCount: 284000,
      ),
      Video(
        id: 'v-global-2',
        title: 'Why Every Developer Should Care About WebAssembly in 2026',
        description:
            'WebAssembly is no longer just a niche technology. Major companies are '
            'adopting it for server-side workloads, edge computing, and plugin systems. '
            'We explain the latest developments and why Wasm might reshape how we build software.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder2/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder2',
        channel: TldrChannel.global,
        duration: const Duration(minutes: 9, seconds: 47),
        publishedAt: yesterday,
        viewCount: 156000,
      ),
      Video(
        id: 'v-global-3',
        title: 'Apple\'s M4 Ultra Is Insane — Here\'s Why',
        description:
            'Apple just dropped the M4 Ultra and the benchmarks are mind-blowing. '
            'We break down the specs, compare it to everything else on the market, '
            'and discuss what this means for professional users and AI workloads.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder3/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder3',
        channel: TldrChannel.global,
        duration: const Duration(minutes: 15, seconds: 12),
        publishedAt: twoDaysAgo,
        viewCount: 421000,
      ),
      Video(
        id: 'v-global-4',
        title: 'The AI Chip War Is Heating Up',
        description:
            'NVIDIA, AMD, Intel, and now Google are all competing to build the best AI '
            'chips. We explain the current landscape, upcoming releases, and what it '
            'means for the future of AI infrastructure.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder4/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder4',
        channel: TldrChannel.global,
        duration: const Duration(minutes: 11, seconds: 8),
        publishedAt: threeDaysAgo,
        viewCount: 198000,
      ),

      // ── TLDR UK ──────────────────────────────────────────
      Video(
        id: 'v-uk-1',
        title: 'UK AI Safety Summit: What Actually Happened',
        description:
            'The UK just hosted another AI Safety Summit and made several major '
            'announcements. We break down the new regulations proposed, which companies '
            'signed on, and what this means for the UK tech industry going forward.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-uk1/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-uk1',
        channel: TldrChannel.uk,
        duration: const Duration(minutes: 14, seconds: 22),
        publishedAt: today,
        viewCount: 87000,
      ),
      Video(
        id: 'v-uk-2',
        title: 'Britain\'s New Tech Tax: Winners and Losers',
        description:
            'The UK government has announced a new digital services tax targeting '
            'large tech companies. We explain who\'s affected, how much they\'ll pay, '
            'and whether this will help or hurt the UK startup ecosystem.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-uk2/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-uk2',
        channel: TldrChannel.uk,
        duration: const Duration(minutes: 10, seconds: 55),
        publishedAt: yesterday,
        viewCount: 62000,
      ),
      Video(
        id: 'v-uk-3',
        title: 'London vs Silicon Valley: Can the UK Compete?',
        description:
            'London\'s tech scene is booming but can it really compete with Silicon '
            'Valley? We look at funding data, talent pipelines, and what UK startups '
            'need to go global.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-uk3/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-uk3',
        channel: TldrChannel.uk,
        duration: const Duration(minutes: 13, seconds: 41),
        publishedAt: threeDaysAgo,
        viewCount: 104000,
      ),

      // ── TLDR EU ──────────────────────────────────────────
      Video(
        id: 'v-eu-1',
        title: 'EU AI Act Is Now In Effect — What Changes',
        description:
            'The EU AI Act is officially being enforced. We explain the risk tiers, '
            'which AI systems are banned outright, compliance deadlines, and what '
            'companies operating in Europe need to do right now to stay legal.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-eu1/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-eu1',
        channel: TldrChannel.eu,
        duration: const Duration(minutes: 16, seconds: 8),
        publishedAt: today,
        viewCount: 132000,
      ),
      Video(
        id: 'v-eu-2',
        title: 'Europe\'s \$10B Semiconductor Push Explained',
        description:
            'The European Chips Act is starting to deliver results. New fabs are being '
            'built in Germany and France, and the EU is investing heavily in chip '
            'sovereignty. We look at what\'s happening and whether Europe can catch up.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-eu2/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-eu2',
        channel: TldrChannel.eu,
        duration: const Duration(minutes: 11, seconds: 33),
        publishedAt: yesterday,
        viewCount: 95000,
      ),
      Video(
        id: 'v-eu-3',
        title: 'GDPR Fines Hit Record \$4.2 Billion in 2025',
        description:
            'GDPR enforcement is getting serious. We break down the biggest fines of '
            'the year, which companies got hit hardest, and the compliance mistakes '
            'you need to avoid.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-eu3/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-eu3',
        channel: TldrChannel.eu,
        duration: const Duration(minutes: 8, seconds: 45),
        publishedAt: twoDaysAgo,
        viewCount: 73000,
      ),

      // ── TLDR US ──────────────────────────────────────────
      Video(
        id: 'v-us-1',
        title: 'Congress Just Passed a Major Tech Bill — Here\'s What\'s In It',
        description:
            'A sweeping new tech regulation bill has passed Congress covering data '
            'privacy, AI oversight, and social media for minors. We break down every '
            'major provision and what it means for tech companies and consumers.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-us1/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-us1',
        channel: TldrChannel.us,
        duration: const Duration(minutes: 13, seconds: 17),
        publishedAt: today,
        viewCount: 215000,
      ),
      Video(
        id: 'v-us-2',
        title: 'The US-China AI Race: 2026 Scorecard',
        description:
            'Where does the US stand against China in the AI race? We compare '
            'investment, talent, research output, and deployed systems to give you '
            'the definitive 2026 scorecard.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-us2/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-us2',
        channel: TldrChannel.us,
        duration: const Duration(minutes: 17, seconds: 2),
        publishedAt: twoDaysAgo,
        viewCount: 342000,
      ),
      Video(
        id: 'v-us-3',
        title: 'Silicon Valley Layoffs: What\'s Really Going On',
        description:
            'Tech layoffs continue but the picture is more nuanced than headlines '
            'suggest. We analyze the data, explain which sectors are growing, and '
            'what the job market actually looks like for developers in 2026.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-us3/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-us3',
        channel: TldrChannel.us,
        duration: const Duration(minutes: 10, seconds: 28),
        publishedAt: fourDaysAgo,
        viewCount: 189000,
      ),

      // ── TLDR Africa ──────────────────────────────────────
      Video(
        id: 'v-africa-1',
        title: 'Africa\'s Fintech Boom Is Just Getting Started',
        description:
            'African fintech companies raised \$3.2B last year and mobile money is '
            'transforming the continent. We look at the biggest players, emerging '
            'markets, and why global investors are paying attention.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-af1/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-af1',
        channel: TldrChannel.africa,
        duration: const Duration(minutes: 12, seconds: 56),
        publishedAt: today,
        viewCount: 45000,
      ),
      Video(
        id: 'v-africa-2',
        title: 'Starlink Is Changing Internet Access Across Africa',
        description:
            'SpaceX\'s Starlink is rapidly expanding across Africa, bringing high-speed '
            'internet to areas that have never had reliable connectivity. We explore '
            'the impact on businesses, education, and local ISPs.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-af2/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-af2',
        channel: TldrChannel.africa,
        duration: const Duration(minutes: 11, seconds: 14),
        publishedAt: yesterday,
        viewCount: 67000,
      ),
      Video(
        id: 'v-africa-3',
        title: 'Nigeria\'s Tech Hub: Inside Lagos\' Startup Scene',
        description:
            'Lagos is becoming one of the world\'s fastest-growing tech hubs. We go '
            'inside the ecosystem to meet founders, explore co-working spaces, and '
            'understand what makes the Nigerian startup scene unique.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-af3/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-af3',
        channel: TldrChannel.africa,
        duration: const Duration(minutes: 14, seconds: 39),
        publishedAt: threeDaysAgo,
        viewCount: 38000,
      ),

      // ── TLDR Daily ───────────────────────────────────────
      Video(
        id: 'v-daily-1',
        title: 'Tech News Roundup: March 30, 2026',
        description:
            'Today\'s top stories: GPT-5 launches, Apple M4 Ultra unveiled, GitHub '
            'Copilot writes PRs, EU AI Act enforcement begins, and SpaceX completes '
            'first orbital cargo mission. All the news in under 10 minutes.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-d1/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-d1',
        channel: TldrChannel.daily,
        duration: const Duration(minutes: 8, seconds: 52),
        publishedAt: today,
        viewCount: 178000,
      ),
      Video(
        id: 'v-daily-2',
        title: 'Tech News Roundup: March 29, 2026',
        description:
            'Yesterday\'s top stories: Rust 2.0 released, quantum computing breakthrough, '
            'new NIST post-quantum standards, Kubernetes 1.32, and more. Your daily '
            'dose of tech news.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-d2/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-d2',
        channel: TldrChannel.daily,
        duration: const Duration(minutes: 7, seconds: 31),
        publishedAt: yesterday,
        viewCount: 152000,
      ),
      Video(
        id: 'v-daily-3',
        title: 'Tech News Roundup: March 28, 2026',
        description:
            'Friday\'s top stories: Llama 4 matches GPT-4, Ethereum L2 milestone, '
            'Chrome removes third-party cookies, and the Stack Overflow developer '
            'survey results are in.',
        thumbnailUrl: 'https://img.youtube.com/vi/placeholder-d3/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=placeholder-d3',
        channel: TldrChannel.daily,
        duration: const Duration(minutes: 9, seconds: 15),
        publishedAt: twoDaysAgo,
        viewCount: 141000,
      ),
    ];
  }
}
