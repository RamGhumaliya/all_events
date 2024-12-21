import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
export 'package:firebase_auth/firebase_auth.dart';

import '../datasources/google_sign_in_datasource.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../models/user_model.dart' as user;

/// Repository implementation for Authentication.
/// This communicates with the data source to perform authentication tasks.
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final GoogleSignInDataSource dataSource;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthenticationRepositoryImpl(this.dataSource);

  /// Signs in the user using the data source's sign-in method.
  @override
  Future<user.User> signInWithGoogle() async {
    return await dataSource.signInWithGoogle();
  }

  /// Checks if the user is authenticated via the data source.
  @override
  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null ||
        _googleSignIn.currentUser != null;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut(); // Sign out of Firebase
    await _googleSignIn.signOut(); // Sign out of Google
  }
}
