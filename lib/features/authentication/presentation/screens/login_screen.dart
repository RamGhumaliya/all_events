import 'package:all_events/core/utils/assets_constants.dart';
import 'package:all_events/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/extensions/spacing.dart';
import '../../../../shared/theme/app_font_style.dart';
import '../../../../shared/widgets/social_login_button.dart';
import '../controllers/authentication_controller.dart';

/// Login screen widget.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authenticationControllerProvider);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(Insets.i20),
          decoration: const BoxDecoration(gradient: AppColors.bgGradientColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Welcome Back ,", style: AppCss.interMedium24),
              VSpace(Sizes.s5),
              Text("You have been missed.", style: AppCss.interMedium18),
              VSpace(Sizes.s30),
              Center(
                child: Image.asset(AssetsConstants.icLoginPageImage,
                    height: Sizes.s400, width: Sizes.s300),
              ),
              VSpace(Sizes.s60),
              Center(
                child: Text(
                  "Enjoy The New Experience AllEvents",
                  style: AppCss.interMedium16,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              // Show loading spinner if user is in loading state
              if (authenticationState.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                SocialLoginButton(
                  onPressed: () async {
                    await ref
                        .read(authenticationControllerProvider.notifier)
                        .signIn(context);
                  },
                  icon: AssetsConstants.icGoogleLogo,
                  buttonText: "Continue with Google",
                ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
