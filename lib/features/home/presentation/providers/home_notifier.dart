// Define the HomeNotifier to manage the state
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepository homeRepository;

  HomeNotifier(this.homeRepository) : super(HomeState());

  Future<void> loadCategories() async {
    state = state.copyWith(isLoadingCategories: true);
    try {
      final categories = await homeRepository.fetchCategories();
      state = state.copyWith(
        categories: categories,
        selectedCategoryUrl:
            categories.isNotEmpty ? categories.first.data : null,
        isLoadingCategories: false,
      );
      // Fetch events for the first category
      loadEvents(state.selectedCategoryUrl);
    } catch (e) {
      state = state.copyWith(
          isLoadingCategories: false, categoryError: e.toString());
    }
  }

  Future<void> loadEvents(String? categoryUrl) async {
    if (categoryUrl == null) return;

    state = state.copyWith(isLoadingEvents: true);
    try {
      final events = await homeRepository.fetchEvents(categoryUrl);
      state = state.copyWith(events: events, isLoadingEvents: false);
    } catch (e) {
      state = state.copyWith(isLoadingEvents: false, eventError: e.toString());
    }
  }

  void toggleGridView() {
    state = state.copyWith(isGridView: !state.isGridView);
  }

  void selectCategory(String categoryUrl) {
    state = state.copyWith(selectedCategoryUrl: categoryUrl);
    loadEvents(categoryUrl);
  }
}
