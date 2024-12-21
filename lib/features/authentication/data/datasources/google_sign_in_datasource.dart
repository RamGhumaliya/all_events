import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../models/user_model.dart' as user;

class GoogleSignInDataSource implements AuthenticationRepository {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  GoogleSignInDataSource(this._googleSignIn, this._firebaseAuth);

  /// Signs in the user via Google with Firebase Authentication.
  @override
  Future<user.User> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw Failure("User canceled sign-in.");
      }

      // Retrieve the authentication credentials from the signed-in user
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Use the Google credentials to sign in with Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Create and return a User entity
      return user.User(
        id: userCredential.user?.uid ?? '',
        name: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
      );
    } catch (e) {
      log(e.toString());
      throw Failure('Error during Google sign-in');
    }
  }

  /// Checks if a user is currently authenticated with Firebase.
  @override
  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }

  /// Signs out the user from both Google and Firebase.
  @override
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
