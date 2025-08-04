import 'package:flutter/material.dart';

class DashboardGridView extends StatelessWidget {
  DashboardGridView({super.key, required this.selectedCategory});
  String selectedCategory;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 160,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: Image.asset(
                          // "assets/images/food/burger/1.jpg",
                          'assets/images/food/$selectedCategory/${index + 1}.jpg',
                        ).image,
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
            ),
          ],
        );
      },
    );
  }
}
