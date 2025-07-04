import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoritesStatus(Meal meal) {
    final isFavoriteMeal = state.contains(meal);

    state =
        isFavoriteMeal
            ? state.where((m) => m.id != meal.id).toList()
            : [...state, meal];
    return !isFavoriteMeal;
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
