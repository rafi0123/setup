import 'package:counter/core/config/config.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      home: Scaffold(
        body: Center(
          child: Text('Running: ${F.title}\n${FlavorConfig.baseUrl}'),
        ),
      ),
    );
  }
}