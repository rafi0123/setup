import 'package:counter/core/config/config.dart';
import 'package:counter/pages/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      home: MyHomePage()
    );
  }
}