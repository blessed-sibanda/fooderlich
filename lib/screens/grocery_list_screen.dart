import 'package:flutter/material.dart';
import 'package:fooderlich/components/grocery_tile.dart';
import 'package:fooderlich/models/grocery_manager.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            // TODO: Wrap in a Dismissable
            // TODO: Wrap in a InkWell
            return GroceryTile(
                item: item,
                onComplete: (change) {
                  manager.completeItem(index, change!);
                });
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16.0);
          },
          itemCount: groceryItems.length),
    );
  }
}
