import 'package:recipe_book_project/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return availableMeals;
});
