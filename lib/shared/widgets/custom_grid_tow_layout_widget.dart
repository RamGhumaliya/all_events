import 'package:flutter/widgets.dart';

import '../theme/app_font_style.dart';

class CustomGridTowColumnLayout extends StatelessWidget {
  final List<Widget> children;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;

  const CustomGridTowColumnLayout({
    super.key,
    required this.children,
    this.controller,
    this.physics,
    this.shrinkWrap = false,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics,
      shrinkWrap: shrinkWrap,
      controller: controller,
      padding: padding,
      itemCount: (children.length / 2).ceil(),
      itemBuilder: (context, index) {
        final leftIndex = index * 2;
        final rightIndex = leftIndex + 1;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: Sizes.s10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: leftIndex < children.length
                      ? children[leftIndex]
                      : const SizedBox()),
              SizedBox(width: Sizes.s20), // Adjust spacing between columns
              Expanded(
                  child: rightIndex < children.length
                      ? children[rightIndex]
                      : const SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
