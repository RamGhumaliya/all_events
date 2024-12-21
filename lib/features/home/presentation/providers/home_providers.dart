import 'package:all_events/core/network/api_client.dart';
import 'package:all_events/features/home/data/datasources/home_remote_data_source.dart';
import 'package:all_events/features/home/data/models/category_model.dart';
import 'package:all_events/features/home/data/models/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';

import 'home_notifier.dart';
import 'home_state.dart';

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return HomeNotifier(homeRepository);
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final homeRemoteDataSource = HomeRemoteDataSource(ApiClient());
  return HomeRepositoryImpl(homeRemoteDataSource);
});
final categoryProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.fetchCategories();
});

final eventProvider = FutureProvider.autoDispose
    .family<List<EventModel>, String>((ref, categoryUrl) async {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.fetchEvents(categoryUrl);
});
