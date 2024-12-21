// ignore_for_file: use_build_context_synchronously

import 'package:all_events/features/home/presentation/widgets/shimmer_widget_category.dart';
import 'package:all_events/shared/extensions/spacing.dart';
import 'package:all_events/shared/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/theme/app_font_style.dart';
import '../../../../shared/widgets/custom_grid_tow_layout_widget.dart';
import '../../../authentication/presentation/controllers/authentication_controller.dart';
import '../providers/home_providers.dart';
import '../widgets/category_list_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/event_card_list_widget.dart';
import '../widgets/no_data_widget.dart';
import '../widgets/shimmer_widget_event_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifierProvider.notifier).loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = ref.read(authenticationRepositoryProvider);
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, ${_firebaseAuth.currentUser?.displayName ?? ""}"),
        actions: [
          GestureDetector(
            onTap: () {
              ref.read(homeNotifierProvider.notifier).toggleGridView();
            },
            child: Icon(
              color: AppColors.whiteColor,
              homeState.isGridView ? Icons.view_list : Icons.grid_on,
            ),
          ),
          HSpace(Sizes.s10),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: AppColors.whiteColor,
            ),
            onPressed: () async {
              await authRepository.logout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.i20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeState.isLoadingCategories
                ? const ShimmerWidgetCategory()
                : homeState.categoryError != null
                    ? CustomErrorWidget(
                        message: "Failed to load categories",
                        onRetry: () => ref
                            .read(homeNotifierProvider.notifier)
                            .loadCategories(),
                      )
                    : homeState.categories.isEmpty
                        ? const NoDataWidget(message: "No categories available")
                        : CategoryListWidget(
                            categories: homeState.categories,
                            onCategorySelected: (url) {
                              ref
                                  .read(homeNotifierProvider.notifier)
                                  .selectCategory(url);
                            },
                          ),
            Expanded(
              child: homeState.isLoadingEvents
                  // ? const ShimmerWidgetEventCard()
                  ? homeState.isGridView
                      ? CustomGridTowColumnLayout(
                          padding: EdgeInsets.zero,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            ...List.generate(
                              10,
                              (index) {
                                return const ShimmerWidgetEventCard();
                              },
                            ),
                          ],
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              VSpace(Sizes.s20),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const ShimmerWidgetEventCard();
                          },
                        )
                  : homeState.eventError != null
                      ? CustomErrorWidget(
                          message: "Failed to load events",
                          onRetry: () => ref
                              .read(homeNotifierProvider.notifier)
                              .loadEvents(homeState.selectedCategoryUrl),
                        )
                      : homeState.events.isEmpty
                          ? const NoDataWidget(
                              message: "No events available in this category")
                          : EventListWidget(
                              events: homeState.events,
                              isGridView: homeState.isGridView,
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
