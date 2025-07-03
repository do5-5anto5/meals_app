import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switch_list_tile_custom.dart';

// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // // Exploring screens replacement instead of just push
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(
      //         context,
      //       ).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTileCustom(
            value: _glutenFreeFilterSet,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            },
          ),SwitchListTileCustom(
            value: _lactoseFreeFilterSet,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });
            },
          ),
          SwitchListTileCustom(
            value: _vegetarianFilterSet,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilterSet = isChecked;
              });
            },
          ),
          SwitchListTileCustom(
            value: _veganFilterSet,
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
          ),
        ],
      ),
    );
  }
}
