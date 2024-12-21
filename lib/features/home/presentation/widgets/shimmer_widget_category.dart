import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/extensions/spacing.dart';
import '../../../../shared/theme/app_font_style.dart';

class ShimmerWidgetCategory extends StatelessWidget {
  const ShimmerWidgetCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.s20),
      height: Sizes.s40,
      child: ListView.separated(
        separatorBuilder: (context, index) => HSpace(Sizes.s10),
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Number of items to show in shimmer effect
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.r10),
                  topRight: Radius.circular(AppRadius.r10),
                  bottomLeft: Radius.circular(AppRadius.r10),
                  bottomRight: Radius.circular(AppRadius.r10),
                ),
              ),
              width: 100,
              height: 60,
            ),
          );
        },
      ),
    );
  }
}
