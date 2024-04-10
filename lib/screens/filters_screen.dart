import 'package:flutter/material.dart';
import 'package:m7_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/Filters";

  final Function? saveFilters;
  final Map<String, bool>? currentFilters;

  const FiltersScreen({Key? key, this.saveFilters, this.currentFilters}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters!["gluten"]!;
    _lactoseFree = widget.currentFilters!["lactose"]!;
    _vegan = widget.currentFilters!["vegan"]!;
    _vegetarian = widget.currentFilters!["vegetarian"]!;
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Map<String, bool> selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian
              };
              widget.saveFilters!(selectedFilters);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Add your meal selection.",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    "Gluten Free",
                    "Only include Gluten free meals.",
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }
                ),
                _buildSwitchListTile(
                    "Lactose Free",
                    "Only include Lactose free meals.",
                    _lactoseFree,
                        (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }
                ),
                _buildSwitchListTile(
                    "Vegetarian",
                    "Only include Vegetarian meals.",
                    _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }
                ),
                _buildSwitchListTile(
                    "Vegan",
                    "Only include Vegan meals.",
                    _vegan,
                        (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
