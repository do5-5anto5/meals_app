import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switch_list_tile_custom.dart';

// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool>currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool dipPop, dynamic result) {
          if(dipPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
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
            ),
            SwitchListTileCustom(
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
      ),
    );
  }
}
