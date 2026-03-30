# TLDR News App

A beautifully crafted Flutter news reader for the [TLDR newsletter](https://tldr.tech) — tech news, simplified.

## Features

- **Multi-category feeds** — Browse Tech, AI, Web Dev, InfoSec, Crypto, DevOps, Design, Marketing, and Founders newsletters
- **Newsletter-style layout** — Articles grouped by section (Headlines, Big Tech, Science, Programming, etc.)
- **Bookmarks** — Save articles for later with swipe-to-dismiss support
- **Search** — Full-text search across article titles, summaries, and sources
- **Dark mode** — System-aware theme with manual light/dark/system toggle
- **Pull-to-refresh** — Refresh feeds with standard pull gesture
- **Share** — Share articles via native share sheet
- **Shimmer loading** — Polished loading skeleton animations

## Architecture

```
lib/
├── main.dart                  # App entry point
├── app.dart                   # MaterialApp configuration
├── core/
│   ├── constants/             # App-wide constants
│   ├── theme/                 # Material 3 theming (light + dark)
│   └── utils/                 # Date formatting, URL helpers
├── models/
│   ├── article.dart           # Article & Newsletter models
│   └── category.dart          # News category enum
├── services/
│   ├── api_service.dart       # Data fetching (swappable)
│   ├── mock_data.dart         # Curated sample data
│   └── storage_service.dart   # SharedPreferences persistence
├── providers/                 # Riverpod state management
│   ├── articles_provider.dart
│   ├── bookmarks_provider.dart
│   ├── category_provider.dart
│   ├── service_providers.dart
│   └── theme_provider.dart
├── screens/
│   ├── home/                  # Main feed with category filtering
│   ├── article_detail/        # Full article view
│   ├── bookmarks/             # Saved articles
│   └── settings/              # Theme, about, links
└── widgets/                   # Shared components
```

**State management:** Riverpod
**Persistence:** SharedPreferences
**Theming:** Material 3 with Google Fonts (Inter)

## Getting Started

```bash
flutter pub get
flutter run
```

## Connecting a Live API

The app is architected so `ApiService` can be swapped from mock data to a real TLDR API or RSS feed parser. Replace the mock calls in `lib/services/api_service.dart` with HTTP requests — the `http` package is already included.

## License

MIT
