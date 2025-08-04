import 'package:account_login/widgets/dashboard_gridview.dart';
import 'package:account_login/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedCategory = 0;
  void onSelectCategory(int index) {
    setState(() {
      selectedCategory = index;
    });
  }

  List<Map<String, dynamic>> categories = [
    {"icon": Icons.fastfood, "label": "Burger"},
    {"icon": Icons.cake, "label": "Desserts"},
    {"icon": Icons.local_drink, "label": "Drinks"},
    {"icon": Icons.local_pizza, "label": "Pizza"},
  ];

  Widget onCategorySelected() {
    return Container(
      height: 100,
      child: ListView(
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          int index = categories.indexOf(category);
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: GestureDetector(
              onTap: () => onSelectCategory(index),
              child: Container(
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: index == selectedCategory
                      ? Colors.orange[400]
                      : Colors.transparent,

                  borderRadius: BorderRadius.circular(15),
                ),
                width: 80,
                // height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      categories[index]["icon"],
                      size: 28,
                      color: Colors.black,
                    ),
                    SizedBox(height: 5),
                    Text(
                      index == selectedCategory
                          ? categories[index]["label"]
                          : "",
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DashboardHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
            child: Row(
              children: [
                Text("Find by Category"),
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
          ),
          onCategorySelected(),
          Expanded(
            child: DashboardGridView(
              selectedCategory: categories[selectedCategory]["label"]
                  .toLowerCase(),
            ),
          ),
        ],
      ),
    );
  }
}
