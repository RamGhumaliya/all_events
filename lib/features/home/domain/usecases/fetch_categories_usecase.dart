import 'package:all_events/features/home/data/models/category_model.dart';

import '../repositories/home_repository.dart';

class FetchCategoriesUseCase {
  final HomeRepository repository;

  FetchCategoriesUseCase(this.repository);

  Future<List<CategoryModel>> call() async {
    return repository.fetchCategories();
  }
}
