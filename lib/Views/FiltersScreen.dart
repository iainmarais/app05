//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:app05/DataProviders/FilterProvider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class FiltersScreen extends ConsumerWidget
{
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    //Watch the provider for updates -> will rerender the UI for this view.
    final filterStates = ref.watch(FilterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body: Column(
          children: [
          CheckboxListTile(
            value: filterStates[Filter.IsGlutenFree], 
            onChanged: (IsSelected)
            {
                ref.read(FilterProvider.notifier).SetFilterState(Filter.IsGlutenFree, IsSelected!);
            },
            title: Text("Gluten-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            contentPadding: const EdgeInsets.only(left: 24, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary),
            CheckboxListTile(
            value: filterStates[Filter.IsLactoseFree], 
            onChanged: (IsSelected)
            {
                ref.read(FilterProvider.notifier).SetFilterState(Filter.IsLactoseFree, IsSelected!);
            },
            title: Text("Lactose-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            contentPadding: const EdgeInsets.only(left: 24, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary),
            CheckboxListTile(
            value: filterStates[Filter.IsVegetarianFriendly], 
            onChanged: (IsSelected)
            {
                ref.read(FilterProvider.notifier).SetFilterState(Filter.IsVegetarianFriendly, IsSelected!);
            },
            title: Text("Vegetarian-friendly",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            contentPadding: const EdgeInsets.only(left: 24, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary),
            CheckboxListTile(
            value: filterStates[Filter.IsVeganFriendly], 
            onChanged: (IsSelected)
            {
              ref.read(FilterProvider.notifier).SetFilterState(Filter.IsVeganFriendly, IsSelected!);
            },
            title: Text("Vegan-friendly",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            contentPadding: const EdgeInsets.only(left: 24, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary)
          ],
        ),
      );
  }
}