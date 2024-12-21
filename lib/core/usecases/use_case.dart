/// Abstract class representing a use case.
/// Use cases define the application's business logic and should return results from a specific operation.
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
