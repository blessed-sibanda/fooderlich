import 'package:flutter/material.dart';
import 'package:fooderlich/models/simple_recipe.dart';
import 'components.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;

  RecipesGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
          itemCount: recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final simpleRecipe = recipes[index];
            return RecipeThumbnail(recipe: simpleRecipe);
          }),
    );
  }
}
