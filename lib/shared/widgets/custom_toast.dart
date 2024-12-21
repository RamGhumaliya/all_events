import 'package:all_events/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ShowCustomToast {
  Future<void> showSuccessToast(
      {String? message = "", String? title = "Success"}) async {
    toastification.dismissAll();
    toastification.show(
      showProgressBar: false,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      backgroundColor: AppColors.greenolor.withOpacity(0.2),
      primaryColor: AppColors.greenolor,
      icon: const Icon(
        Icons.check_circle_outline_outlined,
        size: 30,
        color: AppColors.greenolor,
      ),
      title: Text(title!,
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.32)),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      applyBlurEffect: true,
      borderRadius: BorderRadius.circular(4.0),
      closeOnClick: false,
      dragToClose: true,
    );
  }

  Future<void> showErrorToast(
      {String? message = "", String? title = "Error"}) async {
    toastification.dismissAll();
    toastification.show(
      showProgressBar: false,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      backgroundColor: AppColors.redColor.withOpacity(0.2),
      primaryColor: AppColors.redColor,
      foregroundColor: AppColors.whiteColor,
      icon: const Icon(
        Icons.error_outline,
        size: 30,
        color: AppColors.whiteColor,
      ),
      applyBlurEffect: true,
      title: Text(title!,
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.32)),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(4.0),
      closeOnClick: false,
      dragToClose: true,
    );
  }
}
