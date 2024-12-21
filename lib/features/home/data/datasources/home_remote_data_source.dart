import 'dart:developer';

import '../../../../core/network/api_client.dart';
import '../models/category_model.dart';
import '../models/event_model.dart';

class HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSource(this.apiClient);

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await apiClient.get('categories.json');
    return (response.data as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }

  Future<List<EventModel>> fetchEvents(String url) async {
    try {
      final response = await apiClient.get(url);
      // Extract the list from the "item" field and map each event to an EventModel
      final eventsList = (response.data['item'] as List)
          .map((e) => EventModel.fromJson(e))
          .toList();
      return eventsList;
    } catch (w, s) {
      log(w.toString());
      log(s.toString());
      return [];
    }
  }
}
