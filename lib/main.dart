import 'package:account_login/firebase_options.dart';
import 'package:account_login/screens/dashboard.dart';
import 'package:account_login/screens/forgot_password.dart';
import 'package:account_login/screens/login.dart';
import 'package:account_login/screens/meal_detail.dart';
import 'package:account_login/screens/notifications.dart';
import 'package:account_login/screens/onboarding.dart';
import 'package:account_login/screens/otp.dart';
import 'package:account_login/screens/register.dart';
import 'package:account_login/screens/reset_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

const orange = Color.fromARGB(255, 255, 149, 0);
const grey = Color.fromARGB(255, 107, 107, 107);
const black = Color.fromARGB(255, 0, 0, 0);
const white = Color.fromARGB(255, 255, 255, 255);
final theme = ThemeData(
  scaffoldBackgroundColor: white,
  primaryColor: orange,
  colorScheme: ColorScheme.light(primary: orange),
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    // bodyLarge: TextStyle(color: Colors.white),
    // bodyMedium: TextStyle(color: Colors.white),
    // bodySmall: TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: grey),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: orange,
      foregroundColor: white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      minimumSize: Size(double.infinity, 50),
    ),
  ),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
