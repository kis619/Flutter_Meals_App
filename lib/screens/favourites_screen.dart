import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  static const routeName = '/favourites';

  const FavouritesScreen({super.key, required this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            name: favouriteMeals[i].name,
            id: favouriteMeals[i].id,
            affordability: favouriteMeals[i].affordability,
            complexity: favouriteMeals[i].complexity,
            duration: favouriteMeals[i].duration,
            imageUrl: favouriteMeals[i].imageUrl,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
