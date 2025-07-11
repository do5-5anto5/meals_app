import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.availableMeals,
  });

  final String? title;
  final List<Meal> availableMeals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealDetailsScreen(
              meal: meal,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh... nothing here!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (availableMeals.isNotEmpty) {
      content = ListView.builder(
        itemCount: availableMeals.length,
        itemBuilder:
            (ctx, index) => MealItem(
              meal: availableMeals[index],
              onSelectMeal: (meal) {
                selectMeal(context, meal);
              },
            ),
      );
    }

    return title == null
        ? content
        : Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
