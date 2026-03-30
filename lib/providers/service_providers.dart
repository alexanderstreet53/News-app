import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tldr_news/services/api_service.dart';
import 'package:tldr_news/services/storage_service.dart';

/// SharedPreferences instance — must be overridden at app startup.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences not initialized');
});

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(ref.watch(sharedPreferencesProvider));
});

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
