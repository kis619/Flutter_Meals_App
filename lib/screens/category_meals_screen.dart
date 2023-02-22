import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          final meal = categoryMeals[i];
          return MealItem(
              name: meal.name,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
              imageUrl: meal.imageUrl);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
