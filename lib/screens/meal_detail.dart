import 'dart:ffi';

import 'package:account_login/models/dummy_data.dart';
import 'package:account_login/models/food_item.dart';
import 'package:account_login/widgets/transparent_icon.dart';
import 'package:account_login/utils/text_styles.dart';
import 'package:account_login/widgets/single_meal.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MealDetailScreen extends StatefulWidget {
  MealDetailScreen({
    super.key,
    required this.mealCategory,
    required this.mealIndex,
  });

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
  String mealCategory;
  int mealIndex;
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late List<int> randomIndices = [];
  int _totalQuantity = 1;

  void _generateRandomIndices() {
    final filteredData = foodData
        .where(
          (item) =>
              item.category.name.toLowerCase() ==
              widget.mealCategory.toLowerCase(),
        )
        .toList();
    final random = Random();
    while (randomIndices.length < 2) {
      int randomIndex = random.nextInt(filteredData.length);
      if (randomIndex != widget.mealIndex &&
          !randomIndices.contains(randomIndex)) {
        randomIndices.add(randomIndex);
      }
    }
    print("the list is $randomIndices");
  }

  late FoodItem selectedFood;
  @override
  void initState() {
    super.initState();
    _generateRandomIndices();
    selectedFood = foodData
        .where(
          (item) =>
              item.category.name.toLowerCase() ==
              widget.mealCategory.toLowerCase(),
        )
        .toList()[widget.mealIndex];
  }

  void changeQuantity(String operation) {
    if (operation == '-') {
      if (_totalQuantity == 1) {
        return;
      }
      setState(() {
        _totalQuantity--;
      });
    } else if (operation == '+') {
      setState(() {
        _totalQuantity++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final totalWidth = mediaQuery.size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: TransparentIcon(
          icon: Icons.arrow_back_ios_new,
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Align(
          alignment: Alignment.center,
          child: Text(
            selectedFood.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TransparentIcon(
              icon: Icons.favorite_border,
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: stickyAddToCart(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      selectedFood.imageUrl,

                      width: totalWidth,
                      height: totalWidth,

                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedFood.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_outlined,
                          color: Colors.yellow[800],
                        ),
                        Text(
                          ' ${selectedFood.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.yellow[800],
                          ),
                        ),
                      ],
                    ),

                    buildRow(selectedFood),
                    Divider(color: Colors.grey, thickness: 1, height: 30),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      selectedFood.description,
                      style: AppTextStyles.bodySmall,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Recommended For You"),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(color: Colors.yellow[800]),
                          ),
                        ),
                      ],
                    ),
                    buildMealItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(FoodItem selectedFood) {
    return Row(
      children: [
        Icon(Icons.restaurant_menu, color: Colors.yellow[800]),
        SizedBox(width: 5),
        Text('Free Delivery', style: AppTextStyles.bodySmall),
        Spacer(),
        Icon(Icons.access_time, color: Colors.yellow[800]),
        Text('${selectedFood.duration}', style: AppTextStyles.bodySmall),
        Spacer(),
        Icon(Icons.star, color: Colors.yellow[800]),
        Text('${selectedFood.ratings}', style: AppTextStyles.bodySmall),
      ],
    );
  }

  Widget buildMealItem() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),

      itemBuilder: (context, index) => SingleMeal(
        foodCategories: foodData
            .where(
              (item) =>
                  item.category.name.toLowerCase() ==
                  widget.mealCategory.toLowerCase(),
            )
            .toList(),
        index: randomIndices[index],
      ),
    );
  }

  Widget stickyAddToCart() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: VisualDensity.minimumDensity,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => changeQuantity('-'),
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    '$_totalQuantity',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => changeQuantity('+'),
                    icon: Icon(Icons.add),
                  ),
                  Spacer(),
                  Text(
                    '\$${(selectedFood.price * _totalQuantity).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[800],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
