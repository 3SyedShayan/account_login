import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> cities = ["Islamabad", "Karachi", "Lahore"];
  String selectedCity = "Islamabad";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/fast-food-cover.jpg"),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        DropdownButton(
                          value: selectedCity,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          items: cities.map((String city) {
                            return DropdownMenuItem(
                              value: city,
                              child: Text(city),
                              onTap: () {},
                            );
                          }).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return cities.map((String city) {
                              return Text(
                                "Your Location",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              );
                            }).toList();
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value.toString();
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 5),
                        Icon(Icons.notifications, color: Colors.white),
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
                      "Provide The Best\nFood For you",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
