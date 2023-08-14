import 'package:flutter/material.dart';
import 'package:recipe_book_project/provider/favouriteprovider.dart';
import 'package:recipe_book_project/provider/filterprovider.dart';
import 'package:recipe_book_project/screens/about.dart';
import 'package:recipe_book_project/screens/categories.dart';
import 'package:recipe_book_project/screens/filter.dart';
import 'package:recipe_book_project/screens/meal_screen.dart';
import 'package:recipe_book_project/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop;
    if (identifier == 'filters') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    } else if (identifier == 'about') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    final meals = ref.watch(filteredMealsProvider);
    final favMeals = ref.watch(favouriteMealsProvider);
    Widget activePage = CategoriesScreen(meals: meals);
    var pageTitle = 'Che Nom\'s Recipe Book';

    if (currentPageIndex == 1) {
      activePage = MealsScreen(availableMeals: favMeals);
      pageTitle = 'Favourites Meal';
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: const Color.fromARGB(255, 45, 52, 55)),
      drawer: MainDrawer(
        selectScreen: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: currentPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.info_sharp), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outlined), label: 'Favourites'),
        ],
        backgroundColor: const Color.fromARGB(255, 45, 52, 55),
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}
