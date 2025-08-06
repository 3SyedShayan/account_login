import 'package:account_login/models/dummy_data.dart';
import 'package:account_login/screens/meal_detail.dart';
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
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealDetailScreen(
                  mealCategory: foodCategories[index].category.name,
                  mealIndex: index,
                ),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    width: 160,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(foodCategories[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,

                      child: Icon(Icons.favorite_border, color: Colors.red),
                    ),
                  ),
                ],
              ),
              Text(
                foodCategories[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 5),
                  Text(
                    foodCategories[index].ratings.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.timer, color: Colors.grey, size: 16),
                  Text(
                    foodCategories[index].duration.toString() + " min",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.attach_money_outlined,
                    color: Colors.green,
                    size: 16,
                  ),
                  Text(
                    foodCategories[index].price.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
