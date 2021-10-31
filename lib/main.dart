import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:fooderlich/models/tab_manager.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
        theme: theme,
        title: 'Fooderlich',
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TabManager()),
            ChangeNotifierProvider(create: (context) => GroceryManager()),
          ],
          child: const Home(),
        ));
  }
}
