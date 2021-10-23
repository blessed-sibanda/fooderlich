import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(theme: theme, title: 'Fooderlich', home: const Home());
  }
}
