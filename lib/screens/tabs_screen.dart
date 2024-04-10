import 'package:flutter/material.dart';
import 'package:m7_meals_app/screens/categories_screen.dart';
import 'package:m7_meals_app/screens/favorites_screen.dart';
import 'package:m7_meals_app/widgets/main_drawer.dart';
import 'package:m7_meals_app/models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal>? favoriteMeals;

  const TabsScreen({Key? key, this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, dynamic>> _pages = [];

  @override
  void initState(){
    super.initState();
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {"page": FavoritesScreen(widget.favoriteMeals!), "title": "Your Favorites"},
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      body: _pages[_selectedPageIndex]["page"],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
      ),
    );
  }
}

/*class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Meals"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: "Categories",
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: "Favorites",
                ),
              ],
            ),
          ),
          body: const TabBarView(
              children: [
                CategoriesScreen(),
                FavoritesScreen()
              ]
          ),
        )
    );
  }
}*/
