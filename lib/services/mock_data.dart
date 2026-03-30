import 'package:tldr_news/models/article.dart';
import 'package:tldr_news/models/category.dart';

class MockData {
  MockData._();

  static List<Article> generateArticles() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    return [
      // Today's Tech Newsletter - Headlines
      Article(
        id: 'tech-1',
        title: 'Apple Announces M4 Ultra Chip With 80-Core GPU',
        summary:
            'Apple has unveiled the M4 Ultra, its most powerful chip yet, featuring an '
            '80-core GPU and 32-core CPU. The chip is designed for the new Mac Pro and '
            'Mac Studio, offering up to 3x faster performance than the M2 Ultra. It '
            'supports up to 512GB of unified memory, making it ideal for AI/ML workloads '
            'and professional creative applications.',
        url: 'https://example.com/apple-m4-ultra',
        source: 'The Verge',
        category: NewsCategory.tech,
        section: ArticleSection.bigTech,
        publishedAt: today,
        readTimeMinutes: 3,
      ),
      Article(
        id: 'tech-2',
        title: 'OpenAI Launches GPT-5 With Real-Time Reasoning',
        summary:
            'OpenAI has released GPT-5, featuring significant improvements in reasoning, '
            'multimodal understanding, and real-time interaction capabilities. The model '
            'can now process and respond to video in real-time, and shows major gains on '
            'benchmarks for mathematical reasoning and code generation. API pricing '
            'remains competitive with a new efficient tier.',
        url: 'https://example.com/openai-gpt5',
        source: 'TechCrunch',
        category: NewsCategory.ai,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 4,
      ),
      Article(
        id: 'tech-3',
        title: 'GitHub Copilot Now Writes Entire Pull Requests',
        summary:
            'GitHub has expanded Copilot\'s capabilities to automatically generate complete '
            'pull requests from issue descriptions. The feature, called Copilot Workspace, '
            'analyzes the codebase, proposes changes across multiple files, writes tests, '
            'and creates a detailed PR description. Early users report 40% reduction in '
            'time spent on routine code changes.',
        url: 'https://example.com/github-copilot-prs',
        source: 'GitHub Blog',
        category: NewsCategory.tech,
        section: ArticleSection.bigTech,
        publishedAt: today,
        readTimeMinutes: 3,
      ),

      // Science & Futuristic Tech
      Article(
        id: 'tech-4',
        title: 'SpaceX Starship Completes First Orbital Cargo Mission',
        summary:
            'SpaceX\'s Starship has successfully completed its first commercial orbital '
            'cargo delivery, deploying a constellation of next-generation Starlink '
            'satellites. The booster performed a successful catch landing on its third '
            'attempt, marking a major milestone for reusable heavy-lift rocketry.',
        url: 'https://example.com/spacex-starship-cargo',
        source: 'Space.com',
        category: NewsCategory.tech,
        section: ArticleSection.scienceAndFuturisticTech,
        publishedAt: today,
        readTimeMinutes: 3,
      ),
      Article(
        id: 'tech-5',
        title: 'Breakthrough: Quantum Computer Solves Real-World Optimization Problem',
        summary:
            'Researchers at IBM have demonstrated a quantum computer solving a supply '
            'chain optimization problem faster than any classical computer. Using their '
            'new 1,121-qubit processor, the team showed a practical quantum advantage '
            'for logistics optimization that could save companies millions annually.',
        url: 'https://example.com/quantum-breakthrough',
        source: 'MIT Technology Review',
        category: NewsCategory.tech,
        section: ArticleSection.scienceAndFuturisticTech,
        publishedAt: today,
        readTimeMinutes: 4,
      ),

      // Programming & Dev
      Article(
        id: 'dev-1',
        title: 'Rust 2.0 Released With Major Ergonomic Improvements',
        summary:
            'The Rust programming language has released version 2.0, introducing '
            'simplified lifetime syntax, improved async/await patterns, and a new '
            'trait system that reduces boilerplate by up to 50%. The release maintains '
            'full backward compatibility while making the language significantly more '
            'accessible to newcomers.',
        url: 'https://example.com/rust-2',
        source: 'Rust Blog',
        category: NewsCategory.webDev,
        section: ArticleSection.programmingAndDev,
        publishedAt: today,
        readTimeMinutes: 5,
      ),
      Article(
        id: 'dev-2',
        title: 'Deno 4.0 Achieves Full Node.js Compatibility',
        summary:
            'Deno 4.0 has been released with complete Node.js compatibility, allowing '
            'developers to run any npm package without configuration. The release also '
            'includes built-in SQLite support, improved performance benchmarks showing '
            '2x faster HTTP serving than Node.js, and native TypeScript execution '
            'without compilation steps.',
        url: 'https://example.com/deno-4',
        source: 'Deno Blog',
        category: NewsCategory.webDev,
        section: ArticleSection.programmingAndDev,
        publishedAt: today,
        readTimeMinutes: 3,
      ),
      Article(
        id: 'dev-3',
        title: 'React Server Components Now Supported in All Major Frameworks',
        summary:
            'React Server Components (RSC) are now supported across Next.js, Remix, '
            'and the newly released React Router v7. This marks a significant milestone '
            'in the React ecosystem, with benchmarks showing 60% reduction in client-side '
            'JavaScript and improved Core Web Vitals scores across the board.',
        url: 'https://example.com/react-rsc-everywhere',
        source: 'React Blog',
        category: NewsCategory.webDev,
        section: ArticleSection.programmingAndDev,
        publishedAt: today,
        readTimeMinutes: 4,
      ),

      // AI Category
      Article(
        id: 'ai-1',
        title: 'Claude 4.5 Achieves New State-of-the-Art on Coding Benchmarks',
        summary:
            'Anthropic\'s latest model, Claude 4.5, has achieved top scores on SWE-bench, '
            'HumanEval, and MBPP coding benchmarks. The model shows particular strength '
            'in complex multi-file refactoring tasks and has been praised for its ability '
            'to understand large codebases holistically.',
        url: 'https://example.com/claude-4-5',
        source: 'Anthropic Blog',
        category: NewsCategory.ai,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 3,
      ),
      Article(
        id: 'ai-2',
        title: 'Google DeepMind Develops AI That Discovers New Materials',
        summary:
            'Google DeepMind has developed GNoME, an AI system that has discovered '
            '2.2 million new crystal structures, including 380,000 stable materials '
            'that could be used in next-generation batteries, solar cells, and '
            'superconductors. The findings have been made available to researchers worldwide.',
        url: 'https://example.com/deepmind-materials',
        source: 'Nature',
        category: NewsCategory.ai,
        section: ArticleSection.scienceAndFuturisticTech,
        publishedAt: today,
        readTimeMinutes: 5,
      ),
      Article(
        id: 'ai-3',
        title: 'Open-Source LLM Llama 4 Matches GPT-4 Performance',
        summary:
            'Meta\'s Llama 4, released under an open-source license, matches GPT-4 on '
            'major benchmarks while being small enough to run on consumer hardware. '
            'The model uses a new mixture-of-experts architecture that dramatically '
            'reduces compute requirements without sacrificing capability.',
        url: 'https://example.com/llama-4',
        source: 'Meta AI Blog',
        category: NewsCategory.ai,
        section: ArticleSection.headlines,
        publishedAt: yesterday,
        readTimeMinutes: 4,
      ),

      // InfoSec
      Article(
        id: 'sec-1',
        title: 'Critical Vulnerability Found in Popular Authentication Library',
        summary:
            'A critical remote code execution vulnerability has been discovered in '
            'a widely-used authentication library affecting millions of web applications. '
            'The flaw allows attackers to bypass authentication entirely through a '
            'crafted JWT token. Patches are available and immediate updating is recommended.',
        url: 'https://example.com/auth-vulnerability',
        source: 'BleepingComputer',
        category: NewsCategory.infoSec,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 3,
      ),
      Article(
        id: 'sec-2',
        title: 'NIST Releases Post-Quantum Cryptography Standards',
        summary:
            'NIST has officially published its first set of post-quantum cryptography '
            'standards, providing algorithms designed to withstand attacks from quantum '
            'computers. Organizations are advised to begin planning their migration '
            'strategy now, as the transition is expected to take several years.',
        url: 'https://example.com/nist-pqc',
        source: 'NIST',
        category: NewsCategory.infoSec,
        section: ArticleSection.headlines,
        publishedAt: yesterday,
        readTimeMinutes: 4,
      ),

      // DevOps
      Article(
        id: 'devops-1',
        title: 'Kubernetes 1.32 Introduces Native Sidecar Containers',
        summary:
            'Kubernetes 1.32 has been released with native sidecar container support, '
            'simplifying service mesh deployments and logging architectures. The feature '
            'ensures sidecar containers start before and stop after the main application '
            'container, resolving long-standing lifecycle management challenges.',
        url: 'https://example.com/k8s-132',
        source: 'Kubernetes Blog',
        category: NewsCategory.devOps,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 3,
      ),
      Article(
        id: 'devops-2',
        title: 'Terraform Introduces Native Drift Detection',
        summary:
            'HashiCorp has announced native drift detection for Terraform Cloud and '
            'Enterprise, automatically identifying when real infrastructure diverges '
            'from its declared state. The feature runs continuous checks and can '
            'automatically create remediation plans or alert teams of unauthorized changes.',
        url: 'https://example.com/terraform-drift',
        source: 'HashiCorp Blog',
        category: NewsCategory.devOps,
        section: ArticleSection.launches,
        publishedAt: today,
        readTimeMinutes: 3,
      ),

      // Design
      Article(
        id: 'design-1',
        title: 'Figma Launches AI-Powered Design-to-Code Feature',
        summary:
            'Figma has released a new AI-powered feature that generates production-ready '
            'code directly from designs. Supporting React, SwiftUI, and Flutter, the '
            'tool understands component hierarchies, responsive layouts, and design '
            'tokens, producing code that closely matches existing project conventions.',
        url: 'https://example.com/figma-ai-code',
        source: 'Figma Blog',
        category: NewsCategory.design,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 3,
      ),

      // Founders
      Article(
        id: 'founders-1',
        title: 'YC-Backed AI Startup Raises \$100M at \$2B Valuation in 6 Months',
        summary:
            'A Y Combinator-backed startup building AI agents for enterprise workflow '
            'automation has raised \$100M in Series B funding, reaching a \$2B valuation '
            'just six months after launch. The company reports \$20M ARR and is growing '
            '50% month-over-month, signaling continued strong demand for AI automation.',
        url: 'https://example.com/yc-ai-startup',
        source: 'TechCrunch',
        category: NewsCategory.founders,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 3,
      ),
      Article(
        id: 'founders-2',
        title: '5 Lessons From Building a \$10M ARR Developer Tool',
        summary:
            'The founder of a popular developer productivity tool shares five key '
            'lessons learned on the journey to \$10M ARR: focus on developer experience '
            'above all else, build in public, make pricing dead simple, invest heavily '
            'in documentation, and hire your power users.',
        url: 'https://example.com/founder-lessons',
        source: 'Indie Hackers',
        category: NewsCategory.founders,
        section: ArticleSection.opinions,
        publishedAt: yesterday,
        readTimeMinutes: 6,
      ),

      // Quick Links / Misc
      Article(
        id: 'misc-1',
        title: 'Stack Overflow Survey: Rust Most Loved Language 9th Year Running',
        summary:
            'The annual Stack Overflow Developer Survey results are in, with Rust '
            'maintaining its position as the most loved programming language for the '
            'ninth consecutive year. Python overtakes JavaScript as the most used '
            'language, and AI-assisted development tools see 78% adoption.',
        url: 'https://example.com/so-survey',
        source: 'Stack Overflow',
        category: NewsCategory.tech,
        section: ArticleSection.miscellaneous,
        publishedAt: today,
        readTimeMinutes: 2,
      ),
      Article(
        id: 'misc-2',
        title: 'Linux Kernel 6.12 Released With Real-Time Support',
        summary:
            'Linux kernel 6.12 has been released with built-in real-time (PREEMPT_RT) '
            'support, a feature that has been in development for nearly two decades. '
            'This enables Linux to be used in time-critical applications like industrial '
            'automation and audio processing without custom patches.',
        url: 'https://example.com/linux-612',
        source: 'LWN.net',
        category: NewsCategory.tech,
        section: ArticleSection.miscellaneous,
        publishedAt: yesterday,
        readTimeMinutes: 3,
      ),

      // Crypto
      Article(
        id: 'crypto-1',
        title: 'Ethereum Layer 2 Networks Process More Transactions Than Mainnet',
        summary:
            'For the first time, Ethereum Layer 2 networks are collectively processing '
            'more transactions per second than the Ethereum mainnet. Led by Arbitrum '
            'and Base, L2 networks handled an average of 150 TPS compared to mainnet\'s '
            '15 TPS, validating the rollup-centric scaling roadmap.',
        url: 'https://example.com/eth-l2-milestone',
        source: 'CoinDesk',
        category: NewsCategory.crypto,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 3,
      ),

      // Marketing
      Article(
        id: 'marketing-1',
        title: 'Google Removes Third-Party Cookies From Chrome (Finally)',
        summary:
            'Google has completed the deprecation of third-party cookies in Chrome, '
            'marking the end of a years-long transition period. Advertisers must now '
            'rely on the Privacy Sandbox APIs, first-party data strategies, and '
            'contextual targeting. Early reports suggest minimal impact on well-prepared '
            'advertisers.',
        url: 'https://example.com/chrome-cookies-gone',
        source: 'Search Engine Land',
        category: NewsCategory.marketing,
        section: ArticleSection.headlines,
        publishedAt: today,
        readTimeMinutes: 4,
      ),
    ];
  }
}
