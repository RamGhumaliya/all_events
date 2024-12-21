import 'package:all_events/features/home/data/models/category_model.dart';
import 'package:all_events/features/home/data/models/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/home_repository.dart';

// Define the HomeState to hold the state for categories and events, and also track selectedCategoryUrl and isGridView
class HomeState {
  final List<CategoryModel> categories;
  final List<EventModel> events;
  final String? selectedCategoryUrl;
  final bool isGridView;
  final bool isLoadingCategories;
  final bool isLoadingEvents;
  final String? categoryError;
  final String? eventError;

  HomeState({
    this.categories = const [],
    this.events = const [],
    this.selectedCategoryUrl,
    this.isGridView = false,
    this.isLoadingCategories = true,
    this.isLoadingEvents = true,
    this.categoryError,
    this.eventError,
  });

  HomeState copyWith({
    List<CategoryModel>? categories,
    List<EventModel>? events,
    String? selectedCategoryUrl,
    bool? isGridView,
    bool? isLoadingCategories,
    bool? isLoadingEvents,
    String? categoryError,
    String? eventError,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      events: events ?? this.events,
      selectedCategoryUrl: selectedCategoryUrl ?? this.selectedCategoryUrl,
      isGridView: isGridView ?? this.isGridView,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isLoadingEvents: isLoadingEvents ?? this.isLoadingEvents,
      categoryError: categoryError ?? this.categoryError,
      eventError: eventError ?? this.eventError,
    );
  }
}
