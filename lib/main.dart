import 'package:flutter/material.dart';
import 'package:food_app/screens/auth_screens/login_or_signup_screen.dart';
import 'package:food_app/screens/auth_screens/login_screen.dart';

import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/location_screens/new_address_screen.dart';
import 'package:food_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
  late  Size mq ;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

