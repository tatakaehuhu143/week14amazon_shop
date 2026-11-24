
import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Shop',
      theme: AppTheme.theme,
      home: const LoginPage(),
    );
  }
}