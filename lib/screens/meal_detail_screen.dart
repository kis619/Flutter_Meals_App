import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function(String) toggleFavourite;
  final Function(String) isFavourite;

  const MealDetailScreen(this.toggleFavourite, this.isFavourite, {super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              _buildContainer(
                context: context,
                child: ListView.builder(
                  itemBuilder: (cxt, i) => Card(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(meal.ingredients[i]),
                    ),
                  ),
                  itemCount: meal.ingredients.length,
                ),
              ),
              _buildSectionTitle(context, 'Steps'),
              _buildContainer(
                context: context,
                child: ListView.builder(
                    itemBuilder: (ctx, i) => Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(child: Text('#${i + 1}')),
                              title: Text(meal.steps[i]),
                            ),
                            const Divider(
                              thickness: 2.25,
                              color: Colors.black12,
                            )
                          ],
                        ),
                    itemCount: meal.steps.length),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavourite(mealId),
          child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
        ));
  }

  Container _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Container _buildContainer(
      {required BuildContext context, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }
}
