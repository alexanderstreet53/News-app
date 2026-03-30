import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/core/theme/app_theme.dart';
import 'package:tldr_news/providers/theme_provider.dart';
import 'package:tldr_news/widgets/app_scaffold.dart';

class TldrNewsApp extends ConsumerWidget {
  const TldrNewsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'TLDR News',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const AppScaffold(),
    );
  }
}
