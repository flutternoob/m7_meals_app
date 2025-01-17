import 'package:flutter/material.dart';
import 'package:m7_meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(IconData icon, String title, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),

      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile(Icons.restaurant, "Meals", () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          _buildListTile(Icons.settings, "Filters", () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),

        ],
      ),
    );
  }
}
