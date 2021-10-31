import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:fooderlich/models/profile_manager.dart';
import 'package:fooderlich/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();

  final _appStateManager = AppStateManager();
  // TODO: Define AppRouter

  // TODO: Initialize app router

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _profileManager),
        ChangeNotifierProvider(create: (context) => _groceryManager),
        ChangeNotifierProvider(create: (context) => _appStateManager),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FooderlichTheme.dark();
          } else {
            theme = FooderlichTheme.light();
          }

          return MaterialApp(
            theme: theme,
            title: 'Fooderlich',
            // TODO: Replace with Router Widget
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
