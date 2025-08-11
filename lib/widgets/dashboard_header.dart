import 'package:account_login/screens/notifications.dart';
import 'package:account_login/utils/text_styles.dart';
import 'package:account_login/widgets/transparent_icon.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatefulWidget {
  DashboardHeader({super.key});

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  List<String> cities = ["Islamabad", "Karachi", "Lahore"];

  String selectedCity = "Islamabad";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/fast-food-cover.jpg"),
        Positioned(
          top: 40,
          right: 20,
          child: TransparentIcon(
            icon: Icons.search,
            onPressed: () {
              // Implement search functionality
            },
          ),
        ),
        Positioned(
          top: 40,
          right: 70,
          child: TransparentIcon(
            icon: Icons.notifications_none_outlined,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  DropdownButton(
                    underline: Container(),
                    value: selectedCity,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    ),
                    items: cities.map((String city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city, style: AppTextStyles.bodySmallBold),
                        onTap: () {
                          setState(() {});
                        },
                      );
                    }).toList(),
                    selectedItemBuilder: (BuildContext context) {
                      return cities.map((String city) {
                        return Row(
                          children: [
                            Text(
                              "Your Location",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      }).toList();
                    },
                    onChanged: (value) {
                      selectedCity = value.toString();
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white),
                  Text(
                    selectedCity,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Provide the best\nfood for you",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
