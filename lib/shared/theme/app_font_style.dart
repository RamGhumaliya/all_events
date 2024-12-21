import 'package:all_events/shared/extensions/text_style_extensions.dart';
import 'package:all_events/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'scale.dart';

class AppCss {
  //inter font
  static TextStyle inter = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    color: AppColors.whiteColor,
    letterSpacing: 0,
    height: 1.3,
  );

  //Text Style inter extra bold
  static TextStyle get interExtraBold65 =>
      inter.extraThickBold.size(FontSizes.f65);
  static TextStyle get interExtraBold60 =>
      inter.extraThickBold.size(FontSizes.f60);
  static TextStyle get interExtraBold30 =>
      inter.extraThickBold.size(FontSizes.f30);

  //Text Style inter bold
  static TextStyle get interBlack28 => inter.black.size(FontSizes.f28);
  static TextStyle get interBlack24 => inter.black.size(FontSizes.f24);
  static TextStyle get interBlack20 => inter.black.size(FontSizes.f20);
  static TextStyle get interBlack18 => inter.black.size(FontSizes.f18);
  static TextStyle get interBlack16 => inter.black.size(FontSizes.f16);
  static TextStyle get interBlack14 => inter.black.size(FontSizes.f14);

  //Text Style inter bold
  static TextStyle get interExtraBold22 => inter.extraBold.size(FontSizes.f22);
  static TextStyle get interExtraBold18 => inter.extraBold.size(FontSizes.f18);
  static TextStyle get interExtraBold16 => inter.extraBold.size(FontSizes.f16);
  static TextStyle get interExtraBold14 => inter.extraBold.size(FontSizes.f14);
  static TextStyle get interExtraBold12 => inter.extraBold.size(FontSizes.f12);

  //Text Style semi inter bold
  static TextStyle get interBold50 => inter.bold.size(FontSizes.f50);
  static TextStyle get interBold35 => inter.bold.size(FontSizes.f35);
  static TextStyle get interBold34 => inter.bold.size(FontSizes.f34);
  static TextStyle get interBold28 => inter.bold.size(FontSizes.f28);
  static TextStyle get interBold24 => inter.bold.size(FontSizes.f24);
  static TextStyle get interBold20 => inter.bold.size(FontSizes.f20);
  static TextStyle get interBold18 => inter.bold.size(FontSizes.f18);
  static TextStyle get interBold16 => inter.bold.size(FontSizes.f16);
  static TextStyle get interBold14 => inter.bold.size(FontSizes.f14);
  static TextStyle get interBold12 => inter.bold.size(FontSizes.f12);
  static TextStyle get interBold10 => inter.bold.size(FontSizes.f10);
  static TextStyle get interSemiBold24 => inter.semiBold.size(FontSizes.f24);
  static TextStyle get interSemiBold20 => inter.semiBold.size(FontSizes.f20);
  static TextStyle get interSemiBold18 => inter.semiBold.size(FontSizes.f18);
  static TextStyle get interSemiBold16 => inter.semiBold.size(FontSizes.f16);
  static TextStyle get interSemiBold15 => inter.semiBold.size(FontSizes.f15);
  static TextStyle get interSemiBold14 => inter.semiBold.size(FontSizes.f14);
  static TextStyle get interSemiBold12 => inter.semiBold.size(FontSizes.f12);
  static TextStyle get interSemiBold10 => inter.semiBold.size(FontSizes.f10);

  //Text Style inter medium
  static TextStyle get interMedium34 => inter.medium.size(FontSizes.f34);
  static TextStyle get interMedium30 => inter.medium.size(FontSizes.f30);
  static TextStyle get interMedium28 => inter.medium.size(FontSizes.f28);
  static TextStyle get interMedium26 => inter.medium.size(FontSizes.f26);
  static TextStyle get interMedium24 => inter.medium.size(FontSizes.f24);
  static TextStyle get interMedium22 => inter.medium.size(FontSizes.f22);
  static TextStyle get interMedium20 => inter.medium.size(FontSizes.f20);
  static TextStyle get interMedium18 => inter.medium.size(FontSizes.f18);
  static TextStyle get interMedium16 => inter.medium.size(FontSizes.f16);
  static TextStyle get interMedium14 => inter.medium.size(FontSizes.f14);
  static TextStyle get interMedium13 => inter.medium.size(FontSizes.f13);
  static TextStyle get interMedium12 => inter.medium.size(FontSizes.f12);
  static TextStyle get interMedium10 => inter.medium.size(FontSizes.f10);

  //Text Style inter regular
  static TextStyle get interRegular24 => inter.regular.size(FontSizes.f24);
  static TextStyle get interRegular18 => inter.regular.size(FontSizes.f18);
  static TextStyle get interRegular16 => inter.regular.size(FontSizes.f16);
  static TextStyle get interRegular14 => inter.regular.size(FontSizes.f14);
  static TextStyle get interRegular12 => inter.regular.size(FontSizes.f12);
  static TextStyle get interRegular11 => inter.regular.size(FontSizes.f11);
  static TextStyle get interRegular10 => inter.regular.size(FontSizes.f10);

  static TextStyle get interLight18 => inter.light.size(FontSizes.f18);
  static TextStyle get interLight16 => inter.light.size(FontSizes.f16);
  static TextStyle get interLight14 => inter.light.size(FontSizes.f14);
  static TextStyle get interLight10 => inter.light.size(FontSizes.f10);
  static TextStyle get interLight12 => inter.light.size(FontSizes.f12);
}
