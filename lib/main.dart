import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEA6262)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),

      },
    );
  }
}