import 'package:all_events/features/home/data/models/event_model.dart';
import 'package:all_events/shared/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_router.dart';
import '../../../../shared/extensions/spacing.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_font_style.dart';
import '../../../../shared/widgets/custom_network_image_widget.dart';

class EventCardListWidget extends StatelessWidget {
  final EventModel eventData;

  const EventCardListWidget({
    super.key,
    required this.eventData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.webview.name, pathParameters: {
          'title': eventData.eventname.toString(),
          'url': eventData.eventUrl.toString()
        });
      },
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
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.r10),
                  topRight: Radius.circular(AppRadius.r10),
                  bottomLeft: Radius.circular(AppRadius.r10),
                  bottomRight: Radius.circular(AppRadius.r10),
                ),
              ),
              child: CustomNetworkImageWidget(
                isCircular: false,
                imageUrl: eventData.thumbUrlLarge ?? "",
                name: eventData.eventname ?? "",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.i10, vertical: Insets.i5),
              child: Text(eventData.eventname ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppCss.interMedium16.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.i10, vertical: Insets.i2),
              child: Text(eventData.location ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppCss.interMedium14),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.i10, vertical: Insets.i2),
              child: Text(eventData.endTimeDisplay ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppCss.interMedium14),
            ),
            VSpace(Sizes.s8),
          ],
        ),
      ),
    );
  }
}
