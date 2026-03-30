import 'package:flutter/material.dart';

enum NewsCategory {
  all(
    label: 'All',
    slug: 'all',
    icon: Icons.newspaper,
    color: Color(0xFF0F3460),
    description: 'All TLDR newsletters',
  ),
  tech(
    label: 'Tech',
    slug: 'tech',
    icon: Icons.computer,
    color: Color(0xFF2196F3),
    description: 'The most interesting stories in tech',
  ),
  webDev(
    label: 'Web Dev',
    slug: 'webdev',
    icon: Icons.web,
    color: Color(0xFF4CAF50),
    description: 'Web development news and tutorials',
  ),
  ai(
    label: 'AI',
    slug: 'ai',
    icon: Icons.psychology,
    color: Color(0xFF9C27B0),
    description: 'Artificial intelligence news and research',
  ),
  infoSec(
    label: 'InfoSec',
    slug: 'infosec',
    icon: Icons.security,
    color: Color(0xFFE91E63),
    description: 'Cybersecurity news and analysis',
  ),
  crypto(
    label: 'Crypto',
    slug: 'crypto',
    icon: Icons.currency_bitcoin,
    color: Color(0xFFFF9800),
    description: 'Cryptocurrency and blockchain news',
  ),
  devOps(
    label: 'DevOps',
    slug: 'devops',
    icon: Icons.cloud,
    color: Color(0xFF00BCD4),
    description: 'DevOps, infrastructure, and cloud',
  ),
  design(
    label: 'Design',
    slug: 'design',
    icon: Icons.palette,
    color: Color(0xFFFF5722),
    description: 'UI/UX design news and inspiration',
  ),
  marketing(
    label: 'Marketing',
    slug: 'marketing',
    icon: Icons.campaign,
    color: Color(0xFF795548),
    description: 'Digital marketing strategies and trends',
  ),
  founders(
    label: 'Founders',
    slug: 'founders',
    icon: Icons.rocket_launch,
    color: Color(0xFF607D8B),
    description: 'Startup and entrepreneurship news',
  );

  const NewsCategory({
    required this.label,
    required this.slug,
    required this.icon,
    required this.color,
    required this.description,
  });

  final String label;
  final String slug;
  final IconData icon;
  final Color color;
  final String description;
}
