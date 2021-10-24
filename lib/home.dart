import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/screens/explore_screen.dart';
import 'components/components.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    Card2(
        recipe: ExploreRecipe(
            id: '2',
            cardType: '2',
            authorName: 'Mike Katz',
            role: 'Smoothie Connoisseur',
            profileImage: 'assets/profile_pics/person_katz.jpeg',
            title: 'Recipe',
            subtitle: 'Smoothies',
            backgroundImage: 'assets/magazine_pics/mag2.png')),
    Card3(
        recipe: ExploreRecipe(
            id: '3',
            cardType: '3',
            title: 'Vegan Trends',
            tags: [
              'Healthy',
              'Vegan',
              'Carrots',
              'Greens',
              'Wheat',
              'Pescetarian',
              'Mint',
              'Lemongrass',
              'Salad',
              'Water'
            ],
            backgroundImage: 'assets/magazine_pics/mag3.png')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.book), label: 'Recipes'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'To Buy'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped),
    );
  }
}
