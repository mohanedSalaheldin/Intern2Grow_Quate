import 'package:flutter/material.dart';
import 'package:quate_app/src/config/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.appDefaultTheme,
      title: 'Quates',
      home: const Scaffold(),
    );
  }
}
