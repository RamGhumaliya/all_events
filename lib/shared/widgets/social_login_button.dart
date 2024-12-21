import 'package:all_events/shared/theme/app_font_style.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;
  final String buttonText;
  final VoidCallback onPressed;

  final TextStyle? textStyle;
  const SocialLoginButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.buttonText,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: Sizes.s60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0x0fffffff),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(Insets.i10),
                child: Image.asset(icon),
              ),
            ),
            Expanded(
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: textStyle ?? AppCss.interExtraBold16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
