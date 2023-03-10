import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
