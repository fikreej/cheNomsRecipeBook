import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_book_project/provider/mealprovider.dart';

enum Filter {
  isEasy,
  isMedium,
  isHard,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          //initial value for all filter is false
          Filter.isEasy: false,
          Filter.isMedium: false,
          Filter.isHard: false,
        });

  //when swtiched on, set the choosen filter
  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  //update state of filter , either true or false
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.isEasy]! && !meal.isEasy) {
      return false;
    }
    if (activeFilters[Filter.isMedium]! && !meal.isMedium) {
      return false;
    }
    if (activeFilters[Filter.isHard]! && !meal.isHard) {
      return false;
    }
    return true;
  }).toList();
});
