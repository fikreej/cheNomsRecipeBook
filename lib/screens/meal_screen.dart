import 'package:flutter/material.dart';
import 'package:recipe_book_project/models/meal.dart';
import 'package:recipe_book_project/screens/meal_details.dart';
import 'package:recipe_book_project/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.availableMeals});

  final List<Meal> availableMeals;
  final String? title;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Oh no !! It\'s empty'),
          SizedBox(
            height: 20,
          ),
          Text('Try selecting other categories !'),
        ],
      ),
    );

    if (availableMeals.isNotEmpty) {
      content = ListView.builder(
        itemCount: availableMeals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: availableMeals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
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
      body: content,
    );
  }
}
