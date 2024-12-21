import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/extensions/spacing.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_font_style.dart';

class ShimmerWidgetEventCard extends StatelessWidget {
  const ShimmerWidgetEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(
            AppRadius.r10,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Sizes.s80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.r10),
                  topRight: Radius.circular(AppRadius.r10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.i10, vertical: Insets.i5),
              child: Container(
                height: Sizes.s20,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.i10, vertical: Insets.i2),
              child: Container(
                height: Sizes.s16,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.i10, vertical: Insets.i2),
              child: Container(
                height: Sizes.s16,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            VSpace(Sizes.s8),
          ],
        ),
      ),
    );
  }
}
