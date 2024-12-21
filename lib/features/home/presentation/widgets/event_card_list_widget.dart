import 'package:all_events/features/home/data/models/event_model.dart';
import 'package:all_events/shared/extensions/spacing.dart';
import 'package:all_events/shared/theme/app_font_style.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_grid_tow_layout_widget.dart';
import 'events_card_list_widget.dart';

class EventListWidget extends StatelessWidget {
  final List<EventModel> events;
  final bool isGridView;

  const EventListWidget({
    super.key,
    required this.events,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    return isGridView
        ? CustomGridTowColumnLayout(
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ...List.generate(
                events.length,
                (index) {
                  return InkWell(
                      onTap: () {},
                      child: EventCardListWidget(
                        eventData: events[index],
                      ));
                },
              ),
            ],
          )
        : ListView.separated(
            separatorBuilder: (context, index) => VSpace(Sizes.s20),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return EventCardListWidget(
                eventData: events[index],
              );
            },
          );
  }
}
