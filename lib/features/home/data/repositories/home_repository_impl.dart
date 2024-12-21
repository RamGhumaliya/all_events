import 'package:all_events/features/home/data/models/event_model.dart';
import 'package:all_events/features/home/domain/repositories/home_repository.dart';

import '../datasources/home_remote_data_source.dart';
import '../models/category_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    return remoteDataSource.fetchCategories();
  }

  @override
  Future<List<EventModel>> fetchEvents(String url) async {
    return remoteDataSource.fetchEvents(url);
  }
}
