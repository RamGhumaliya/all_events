// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../shared/widgets/custom_toast.dart';
import '../../data/datasources/google_sign_in_datasource.dart';
import '../../data/repositories/authentication_repository_impl.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/usecases/sign_in_with_google.dart';

/// State class to represent different authentication states.
/// Can be loading, authenticated, or error state.
class AuthenticationState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? errorMessage;

  AuthenticationState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.errorMessage,
  });

  @override
  String toString() {
    return 'AuthenticationState{isLoading: $isLoading, isAuthenticated: $isAuthenticated, errorMessage: $errorMessage}';
  }
}

/// Controller class for managing the authentication process.
/// It uses Riverpod's StateNotifier to manage and notify the UI of state changes.
class AuthenticationController extends StateNotifier<AuthenticationState> {
  final SignInWithGoogle signInWithGoogle;

  AuthenticationController(this.signInWithGoogle)
      : super(AuthenticationState());

  bool get isAuthenticated => state.isAuthenticated;
  bool get isLoading => state.isLoading;
  String? get errorMessage => state.errorMessage;

  /// Attempts to sign in the user via Google.
  /// Updates the state based on the result: loading, success, or error.
  Future<void> signIn(BuildContext context) async {
    state = AuthenticationState(isLoading: true);
    try {
      final user = await signInWithGoogle.call(NoParams());
      log(
        user.name,
      );
      state = AuthenticationState(isLoading: false, isAuthenticated: true);
      context.go("/home");
      log(state.toString(), name: "FUNCTION");
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      state = AuthenticationState(isLoading: false, errorMessage: e.toString());
      ShowCustomToast().showErrorToast(
        title: "Google login failed",
      );
    }
  }
}

/// Provider for AuthenticationRepository.
/// This provider creates an instance of AuthenticationRepositoryImpl using the data source.
final authenticationRepositoryProvider =
    Provider<AuthenticationRepository>((ref) {
  final googleSignInDataSource =
      GoogleSignInDataSource(GoogleSignIn(), FirebaseAuth.instance);
  return AuthenticationRepositoryImpl(googleSignInDataSource);
});

/// Provider to access and interact with the AuthenticationController.
/// This provider is required to be defined for the AuthenticationController to work properly.
final signInWithGoogleProvider = Provider<SignInWithGoogle>((ref) {
  // Get the signInWithGoogle use case from the DI container or repository
  return SignInWithGoogle(ref.read(authenticationRepositoryProvider));
});

/// Provider to access and interact with the AuthenticationController.
final authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, AuthenticationState>(
        (ref) => AuthenticationController(ref.read(signInWithGoogleProvider)));
