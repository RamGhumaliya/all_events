import 'package:all_events/shared/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:all_events/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/app_font_style.dart';
import '../providers/home_providers.dart';

class CategoryListWidget extends ConsumerWidget {
  final List<CategoryModel> categories;
  final Function(String) onCategorySelected;

  const CategoryListWidget(
      {super.key, required this.categories, required this.onCategorySelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.s20),
      height: Sizes.s40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onCategorySelected(categories[index].data),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                color: homeState.selectedCategoryUrl == categories[index].data
                    ? const WidgetStatePropertyAll(AppColors.primaryColor)
                    : const WidgetStatePropertyAll(Colors.transparent),
                label: Text(categories[index].category),
              ),
            ),
          );
        },
      ),
    );
  }
}
