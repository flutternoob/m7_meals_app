import 'package:flutter/material.dart';
import 'package:m7_meals_app/widgets/meal_item.dart';
import 'package:m7_meals_app/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal>? availableMeals;

  /*final String? categoryId;
  final String? categoryTitle;*/
  const CategoryMealsScreen({Key? key, this.availableMeals}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal> displayedMeals = [];
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final Map<String, String?> routeArgs =
      ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
      categoryTitle = routeArgs["title"]!;
      final String categoryId = routeArgs["id"]!;
      displayedMeals = widget.availableMeals!.where((meal) {
        return meal.categories!.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  /*void _removeMeal(String mealId) {
setState(() {
  displayedMeals.removeWhere((meal) {
    return meal.id == mealId;
  });
});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
