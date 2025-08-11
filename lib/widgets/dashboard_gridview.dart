import 'package:account_login/models/dummy_data.dart';
import 'package:account_login/screens/meal_detail.dart';
import 'package:account_login/widgets/single_meal.dart';
import 'package:flutter/material.dart';

class DashboardGridView extends StatelessWidget {
  DashboardGridView({super.key, required this.selectedCategory});
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    print(selectedCategory);
    // Filter foodData by matching category name with selectedCategory
    final foodCategories = foodData
        .where(
          (item) =>
              item.category.name.toLowerCase() ==
              selectedCategory.toLowerCase(),
        )
        .toList();
    print(foodCategories);
    return GridView.builder(
      // shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: foodCategories.length,
      itemBuilder: (context, index) {
        return SingleMeal(foodCategories: foodCategories, index: index);
      },
    );
  }
}
