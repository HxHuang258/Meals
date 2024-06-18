import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(
    {
      super.key,
    }
  );

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const CategoriesScreen();
    String activeTitle = 'Categories';

    if (_selectedPageIndex == 1) {
    activeScreen = const MealsScreen(meals: []);
    activeTitle = 'Favourites';
  }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: ('Categories')),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ('Favourites')),
        ],
      ),
    );
  }
}