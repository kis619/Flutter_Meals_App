import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  final List<Meal> favouriteMeals;

  const TabsScreen(this.favouriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIdx = 0;

  @override
  void initState() {
    _pages =  [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(favouriteMeals: widget.favouriteMeals),
        'title': 'Favourites',
      },
    ];
    super.initState();
  }

  void _selectPage(int i) {
    setState(() {
      _selectedPageIdx = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIdx]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIdx]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIdx,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}
