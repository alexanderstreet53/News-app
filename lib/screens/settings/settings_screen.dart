import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/core/utils/url_helper.dart';
import 'package:tldr_news/providers/theme_provider.dart';
import 'package:tldr_news/screens/bookmarks/bookmarks_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('More', style: theme.appBarTheme.titleTextStyle),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 8),

          // Quick actions
          _SectionLabel(text: 'QUICK ACTIONS'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _QuickAction(
                  icon: Icons.bookmark_border_rounded,
                  label: 'Bookmarks',
                  color: const Color(0xFF6C5CE7),
                  isDark: isDark,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const BookmarksScreen(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _QuickAction(
                  icon: Icons.dark_mode_rounded,
                  label: _themeModeLabel(themeMode),
                  color: const Color(0xFFFF6B6B),
                  isDark: isDark,
                  onTap: () => _showThemePicker(context, ref, themeMode),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),
          _SectionLabel(text: 'TLDR'),
          const SizedBox(height: 8),
          _SettingsCard(
            isDark: isDark,
            children: [
              _SettingsRow(
                icon: Icons.email_outlined,
                label: 'Subscribe to Newsletter',
                isDark: isDark,
                onTap: () =>
                    UrlHelper.openUrl('https://tldr.tech/#newsletter'),
              ),
              _SettingsDivider(isDark: isDark),
              _SettingsRow(
                icon: Icons.language_rounded,
                label: 'Visit TLDR Website',
                isDark: isDark,
                onTap: () => UrlHelper.openUrl('https://tldr.tech'),
              ),
            ],
          ),

          const SizedBox(height: 28),
          _SectionLabel(text: 'ABOUT'),
          const SizedBox(height: 8),
          _SettingsCard(
            isDark: isDark,
            children: [
              _SettingsRow(
                icon: Icons.info_outline_rounded,
                label: 'App Version',
                trailing: '1.0.0',
                isDark: isDark,
              ),
              _SettingsDivider(isDark: isDark),
              _SettingsRow(
                icon: Icons.privacy_tip_outlined,
                label: 'Privacy Policy',
                isDark: isDark,
                onTap: () => UrlHelper.openUrl('https://tldr.tech/privacy'),
              ),
              _SettingsDivider(isDark: isDark),
              _SettingsRow(
                icon: Icons.description_outlined,
                label: 'Terms of Service',
                isDark: isDark,
                onTap: () => UrlHelper.openUrl('https://tldr.tech/terms'),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Footer
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6C5CE7), Color(0xFFA78BFA)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'TLDR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'News',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Tech news, simplified.',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  String _themeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  void _showThemePicker(
    BuildContext context,
    WidgetRef ref,
    ThemeMode current,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF161933) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Appearance',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _ThemeOption(
                      icon: Icons.phone_android_rounded,
                      label: 'System',
                      isSelected: current == ThemeMode.system,
                      isDark: isDark,
                      onTap: () {
                        ref
                            .read(themeModeProvider.notifier)
                            .setThemeMode(ThemeMode.system);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 10),
                    _ThemeOption(
                      icon: Icons.light_mode_rounded,
                      label: 'Light',
                      isSelected: current == ThemeMode.light,
                      isDark: isDark,
                      onTap: () {
                        ref
                            .read(themeModeProvider.notifier)
                            .setThemeMode(ThemeMode.light);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 10),
                    _ThemeOption(
                      icon: Icons.dark_mode_rounded,
                      label: 'Dark',
                      isSelected: current == ThemeMode.dark,
                      isDark: isDark,
                      onTap: () {
                        ref
                            .read(themeModeProvider.notifier)
                            .setThemeMode(ThemeMode.dark);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            letterSpacing: 2,
            color: const Color(0xFF6C5CE7),
          ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isDark;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF161933) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.04)
                : Colors.black.withOpacity(0.03),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final bool isDark;
  final List<Widget> children;

  const _SettingsCard({required this.isDark, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161933) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.04)
              : Colors.black.withOpacity(0.03),
        ),
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailing;
  final bool isDark;
  final VoidCallback? onTap;

  const _SettingsRow({
    required this.icon,
    required this.label,
    this.trailing,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 20,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            if (trailing != null)
              Text(
                trailing!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            if (onTap != null)
              Icon(Icons.chevron_right_rounded,
                  size: 18,
                  color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  final bool isDark;
  const _SettingsDivider({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 1,
        color: isDark
            ? Colors.white.withOpacity(0.04)
            : Colors.black.withOpacity(0.04),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF6C5CE7).withOpacity(0.12)
                : (isDark
                    ? Colors.white.withOpacity(0.04)
                    : Colors.black.withOpacity(0.03)),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF6C5CE7).withOpacity(0.3)
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 24,
                color: isSelected
                    ? const Color(0xFF6C5CE7)
                    : (isDark ? Colors.grey.shade500 : Colors.grey.shade500),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF6C5CE7)
                      : (isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
