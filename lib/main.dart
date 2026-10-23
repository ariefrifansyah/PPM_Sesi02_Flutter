import 'package:flutter/material.dart';
import '../constants/color.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPM Sesi 2 - E-Commerce',
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: appPrimaryBlue,
        scaffoldBackgroundColor: const Color(0xFFF5F8FF),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: appDarkNavy,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const MainPage(),
    );
  }
}