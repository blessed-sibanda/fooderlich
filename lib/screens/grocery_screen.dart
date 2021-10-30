import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:fooderlich/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        // TODO: Add GroceryListScreen
        return Container();
      } else {
        return const EmptyGroceryScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildGroceryScreen();
  }
}
