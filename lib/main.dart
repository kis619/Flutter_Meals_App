import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import './screens/filters_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';
import 'screens/meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) return false;
        if (_filters['lactose'] == true && !meal.isLactoseFree) return false;
        if (_filters['vegan'] == true && !meal.isVegan) return false;
        if (_filters['vegetarian'] == true && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    print("Toggle favourite");
    final existingIdx = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    setState(() {
      if (existingIdx == -1) {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      } else {
        _favouriteMeals.removeAt(existingIdx);
      }
    });
  }

  bool _mealIsFavourite(String mealId) {
    print("MEAL IS FAVOURITE");
    return _favouriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.orange,
          canvasColor: const Color.fromARGB(255, 234, 247, 148),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, .8)),
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, .8)),
                bodySmall:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, .8)),
                titleLarge: const TextStyle(
                    fontSize: 24, fontFamily: 'RobotoCondensed'),
                titleMedium: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
                titleSmall: const TextStyle(
                    fontSize: 24, fontFamily: 'RobotoCondensed'),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
              .copyWith(secondary: Colors.deepPurpleAccent)),
      home: TabsScreen(_favouriteMeals),
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(_favouriteMeals),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilters),
        MealsScreen.routeName: (ctx) =>
            MealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavourite, _mealIsFavourite),
        // FavouritesScreen.routeName: (ctx) => const FavouritesScreen(),
      },
      // onGenerateRoute: (settings) {
      //   // print(settings.arguments);
      //   // return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
