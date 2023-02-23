import 'package:flutter/material.dart';
import 'package:meals_app/screens/favourites_screen.dart';

import './categories_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
          bottom: const TabBar(
            indicatorColor: Colors.red,
            indicatorWeight: 6,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              )
            ],
          ),
        ),
        body: const TabBarView(
            children: <Widget>[CategoriesScreen(), FavouritesScreen()]),
      ),
    );
  }
}
