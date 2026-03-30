import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tldr_news/models/category.dart';

final selectedCategoryProvider =
    StateProvider<NewsCategory>((ref) => NewsCategory.all);
