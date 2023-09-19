//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:flutter/material.dart";

class Flyout extends StatelessWidget
{
  //Possibly use fully declared functions/methods here? 
  //Use callbacks to the tab bar which serves as the root of this project?
  final void Function(String ViewName)? LoadScreen;
  const Flyout({this.LoadScreen, super.key});

  @override 
  Widget build(BuildContext context)
  {
    //This is the container for our flyout
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  //Use the primary theme colour:
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                  ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                )
              ),
            child: Row(
              children: [
                Icon(Icons.food_bank_outlined, color: Theme.of(context).colorScheme.primary, size: 40),
                const SizedBox(width: 10),
                Text("Cookin' up something?", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary))
              ]
            )
          ),
          //Nav options:
          ListTile(
            onTap: () {LoadScreen!("Categories");},
            leading: const Icon(Icons.checklist_outlined),
            title: Text("Categories",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          ),
          ListTile(
            //To make these items interactive we need event handlers.
            onTap: () {LoadScreen!("Filters");},
            leading: const Icon(Icons.filter_alt_outlined),
            title: Text("Filters",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          ),
          ListTile(
            onTap:(){},
            leading: const Icon(Icons.restaurant_outlined),
            title: Text("Meals",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          ),
          ListTile(
            //To make these items interactive we need event handlers.
            onTap: () {LoadScreen!("Favourites");},
            leading: const Icon(Icons.favorite_outline),
            title: Text("Favourites",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          ),
        ]
      )
    );
  }
}