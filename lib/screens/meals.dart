import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavourite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,
              onToggleFavourite: onToggleFavourite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          children: [
            Text(
              'Uh oh ... Nothing here',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 16),
            Text('Add a meal'),
          ],
        ),
      );
    } else {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(meal: meals[index], onSelectedMeal: (meal) { selectMeal(context, meal); }
          ),
          );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
