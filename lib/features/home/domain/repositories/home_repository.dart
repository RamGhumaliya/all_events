import 'package:all_events/features/home/data/models/category_model.dart';
import 'package:all_events/features/home/data/models/event_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<EventModel>> fetchEvents(String url);
}
