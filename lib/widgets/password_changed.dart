import 'package:account_login/screens/login.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset('assets/images/celebration.png', width: 100, height: 100),
          Text("Password Changed", style: TextStyle(fontSize: 30)),
          Text(
            "Password changed successfully, you can login again with your new credentials",
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
