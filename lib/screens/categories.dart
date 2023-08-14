import 'package:flutter/material.dart';
import 'package:recipe_book_project/data/data.dart';
import 'package:recipe_book_project/models/category.dart';
import 'package:recipe_book_project/models/meal.dart';
import 'package:recipe_book_project/screens/meal_screen.dart';
import 'package:recipe_book_project/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.meals});

  final List<Meal> meals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _selectCategory(context, Category category) {
    final filteredMeals = widget.meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          availableMeals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ]),
    );
  }
}
