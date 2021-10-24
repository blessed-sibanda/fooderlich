import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/models/explore_data.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (BuildContext context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.hasData) {
            final recipes = snapshot.data!.todayRecipes;
            final posts = snapshot.data!.friendPosts;
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: recipes),
                const SizedBox(
                  height: 16,
                ),
                FriendPostListView(friendPosts: posts),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
