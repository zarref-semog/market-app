import 'package:flutter/material.dart';
import 'package:store_app_1/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 0, 204, 204),
          primary: Color.fromARGB(255, 0, 204, 204),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
