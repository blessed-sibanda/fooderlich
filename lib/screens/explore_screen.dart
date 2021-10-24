import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/models/explore_data.dart';
import '../components/components.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ScrollController _controller = ScrollController();
  final mockService = MockFooderlichService();

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the bottom');
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the top');
    }
  }

  @override
  void initState() {
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

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
              controller: _controller,
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
