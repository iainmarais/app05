//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

import "package:flutter/material.dart";

class FiltersScreen extends StatefulWidget
{
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> 
{
  bool IsGlutenFree = false;
  bool IsLactoseFree = false;
  bool IsVegetarianFriendly = false;
  bool IsVeganFriendly = false;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body:Column(
        children: [
        CheckboxListTile(
          value: IsGlutenFree, 
          onChanged: (IsSelected)
          {
            setState(() {
              IsGlutenFree = IsSelected!;
            });
          },
          title: Text("Gluten-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          contentPadding: const EdgeInsets.only(left: 24, right: 22),
          activeColor: Theme.of(context).colorScheme.tertiary),
          CheckboxListTile(
          value: IsLactoseFree, 
          onChanged: (IsSelected)
          {
            setState(() {
              IsLactoseFree = IsSelected!;
            });
          },
          title: Text("Lactose-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          contentPadding: const EdgeInsets.only(left: 24, right: 22),
          activeColor: Theme.of(context).colorScheme.tertiary),
          CheckboxListTile(
          value: IsVegetarianFriendly, 
          onChanged: (IsSelected)
          {
            setState(() {
              IsVegetarianFriendly = IsSelected!;
            });
          },
          title: Text("Vegetarian-friendly",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          contentPadding: const EdgeInsets.only(left: 24, right: 22),
          activeColor: Theme.of(context).colorScheme.tertiary),
          CheckboxListTile(
          value: IsVeganFriendly, 
          onChanged: (IsSelected)
          {
            setState(() {
              IsVeganFriendly = IsSelected!;
            });
          },
          title: Text("Vegan-friendly",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          contentPadding: const EdgeInsets.only(left: 24, right: 22),
          activeColor: Theme.of(context).colorScheme.tertiary)
        ],
      ));
  }
}