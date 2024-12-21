import '../../data/models/user_model.dart';

/// Abstract class for the Authentication Repository.
/// This defines the required methods for interacting with the authentication system.
abstract class AuthenticationRepository {
  /// Signs in with Google and returns a User entity.
  Future<User> signInWithGoogle();

  /// Checks if a user is authenticated.
  bool isAuthenticated();

  /// Logs out the user.
  Future<void> logout();
}
