import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_book_project/provider/filterprovider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Card(
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Easy Meal',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20),
              ),
              value: activeFilters[Filter.isEasy]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.isEasy, isChecked);
              },
            ),
            SwitchListTile(
                title: Text('Medium Meal',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20)),
                value: activeFilters[Filter.isMedium]!,
                onChanged: (isChecked) {
                  ref
                      .read(filtersProvider.notifier)
                      .setFilter(Filter.isMedium, isChecked);
                }),
            SwitchListTile(
              title: Text('Hard Meal',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20)),
              value: activeFilters[Filter.isHard]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.isHard, isChecked);
              },
            ),
          ],
        ),
      ),
    );
  }
}
