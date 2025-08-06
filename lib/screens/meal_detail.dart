import 'package:account_login/models/dummy_data.dart';
import 'package:account_login/models/food_item.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final totalWidth = mediaQuery.size.width;
    FoodItem selectedFood = foodData
        .where(
          (item) =>
              item.category.name.toLowerCase() ==
              widget.mealCategory.toLowerCase(),
        )
        .toList()[widget.mealIndex];

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              height: 40,
              width: 40,
              child: IconButton(
                alignment: Alignment.center,
                icon: Icon(Icons.favorite_border_outlined, color: Colors.white),
                onPressed: () {
                  // Handle heart button press
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
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
                      'Meal Detail',
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
                    Row(
                      children: [
                        Icon(Icons.restaurant_menu, color: Colors.yellow[800]),
                        Text('Free Delivery', style: TextStyle(fontSize: 18)),
                        // SizedBox(width: 30),
                        Spacer(),
                        Icon(Icons.access_time, color: Colors.yellow[800]),
                        Text(
                          '${selectedFood.duration}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        // SizedBox(width: 30),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Text(
                          '${selectedFood.ratings}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Here you can view the details of the selected meal.',
                      style: TextStyle(fontSize: 16),
                    ),

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
                      style: TextStyle(fontSize: 16),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
