import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.name,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal() {}
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    width: 305,
                    color: Colors.black54,
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconAndText(
                    text: '${duration.toString()} minutes',
                    icon: Icons.schedule,
                  ),
                  IconAndText(
                    text: complexityText,
                    icon: Icons.work,
                  ),
                  IconAndText(
                    text: affordabilityText,
                    icon: Icons.attach_money,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  final IconData icon;
  const IconAndText({super.key, required this.text, required this.icon});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text('$text'),
      ],
    );
  }
}
