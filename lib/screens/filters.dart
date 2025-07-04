import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/switch_list_tile_custom.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: Column(
          children: [
            SwitchListTileCustom(
              value: activeFilters[Filter.glutenFree]!,
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
            ),
            SwitchListTileCustom(
              value: activeFilters[Filter.lactoseFree]!,
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
            ),
            SwitchListTileCustom(
              value: activeFilters[Filter.vegetarian]!,
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
            ),
            SwitchListTileCustom(
              value: activeFilters[Filter.vegan]!,
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
            ),
          ],
        ),
    );
  }
}
