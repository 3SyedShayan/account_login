import 'package:account_login/widgets/dashboard_gridview.dart';
import 'package:account_login/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedCategory = 1;
  void onSelectCategory(int index) {
    setState(() {
      selectedCategory = index;
    });
  }

  List<Map<String, dynamic>> categories = [
    {"icon": Icons.fastfood, "label": "Burger"},
    {"icon": Icons.cake, "label": "Dessert"},
    {"icon": Icons.local_drink, "label": "Drink"},
    {"icon": Icons.local_pizza, "label": "Pizza"},
  ];

  Widget onCategorySelected() {
    return Container(
      alignment: Alignment.center,
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

  int selectedBottomNavIndex = 0;
  void onBottomNavTap(int index) {
    setState(() {
      selectedBottomNavIndex = index;
    });
  }

  List<Map<String, dynamic>> bottomNavItems = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.search, "label": "Search"},
    {"icon": Icons.favorite_border, "label": "Favorites"},
    {"icon": Icons.person, "label": "Profile"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomNavIndex,
        onTap: onBottomNavTap,
        type: BottomNavigationBarType.shifting, // Show all tabs
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange[600],
        unselectedItemColor: Colors.grey[400],
        selectedFontSize: 12,
        unselectedFontSize: 10,
        elevation: 0,
        items: bottomNavItems.map((item) {
          int index = bottomNavItems.indexOf(item);
          return BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Icon(
                item["icon"],
                size: index == selectedBottomNavIndex ? 28 : 24,
              ),
            ),
            label: item["label"],
          );
        }).toList(),
      ),
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
