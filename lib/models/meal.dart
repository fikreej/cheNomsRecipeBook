enum PreparationTime {
  Quick,
  Average,
  Long,
}

enum CookingTime {
  Quick,
  Average,
  Long,
}

enum Serving {
  Small,
  Medium,
  Many,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.preppingTime,
    required this.cookingTime,
    required this.isEasy,
    required this.isMedium,
    required this.isHard,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final PreparationTime preppingTime;
  final CookingTime cookingTime;
  final bool isEasy;
  final bool isMedium;
  final bool isHard;
}
