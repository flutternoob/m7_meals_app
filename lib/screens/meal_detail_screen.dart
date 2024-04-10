import 'package:flutter/material.dart';

import 'package:m7_meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  final Function toggleFavorite;

  final Function isFavorite;

  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {Key? key}) : super(key: key);

  Widget _buildSectionTitle(BuildContext context, String sectionTitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(sectionTitle, style: Theme.of(context).textTheme.titleLarge,),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl!, fit: BoxFit.cover,),
            ),
            _buildSectionTitle(context, "Ingredients"),
            _buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                        child: Text(selectedMeal.ingredients![index]),
                      ),
                    );
                  },
                )
            ),
            _buildSectionTitle(context, "Steps"),
            _buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.steps!.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index+1}"),
                        ),
                        title: Text(selectedMeal.steps![index]),
                      ),
                      const Divider()
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealId)? const Icon(Icons.star): const Icon(Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
