import '../../data/models/event_model.dart';
import '../repositories/home_repository.dart';

class FetchEventsByCategoryUseCase {
  final HomeRepository repository;

  FetchEventsByCategoryUseCase(this.repository);

  Future<List<EventModel>> call(String url) async {
    return repository.fetchEvents(url);
  }
}
