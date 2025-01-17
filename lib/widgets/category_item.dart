import 'package:flutter/material.dart';
import 'package:m7_meals_app/screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

  const CategoryItem(this.id, this.title, this.color, {Key? key}) : super(key: key);

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color!.withOpacity(0.7), color!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(title!, style: Theme.of(context).textTheme.titleLarge,),
      ),
    );
  }
}
