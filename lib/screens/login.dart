import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Login to your \naccount.',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text("Please sign in to your account"),
            SizedBox(height: 25),
            Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Email',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 10),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (value) {
                // Handle password input changes
              },
            ),
            Text("Forgot Password?"),
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
