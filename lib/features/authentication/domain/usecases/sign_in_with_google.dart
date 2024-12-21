import '../../../../core/usecases/use_case.dart';
import '../../data/models/user_model.dart';
import '../repositories/authentication_repository.dart';

/// Use case for signing in with Google.
/// It interacts with the repository to authenticate the user and retrieve the user information.
class SignInWithGoogle implements UseCase<User, NoParams> {
  final AuthenticationRepository repository;

  SignInWithGoogle(this.repository);

  @override
  Future<User> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}

/// A class to represent parameters, if any, needed for use cases.
/// This is an empty class as `SignInWithGoogle` does not require parameters.
class NoParams {}
