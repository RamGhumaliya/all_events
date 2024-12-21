import 'package:all_events/core/utils/assets_constants.dart';
import 'package:all_events/shared/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/theme/app_colors.dart';
import '../controllers/authentication_controller.dart';

/// Splash screen widget.
/// It shows an initial loading screen before navigating to the login or home screen based on authentication.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.read(authenticationRepositoryProvider);

    // Delay to simulate loading before navigating
    Future.delayed(const Duration(seconds: 3), () {
      // Check if the user is authenticated
      final isAuthenticated = authRepo.isAuthenticated();
      if (isAuthenticated) {
        // Navigate to Home Screen if authenticated
        context.go('/home');
      } else {
        // Navigate to Login Screen if not authenticated
        context.go('/login');
      }
    });

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(gradient: AppColors.bgGradientColor),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          child: Image.asset(
            AssetsConstants.appSplashLogo,
            height: Sizes.s200,
            width: Sizes.s200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
