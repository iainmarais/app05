//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:flutter/material.dart";

//A flyout is a type of screen widget that pulls towards: up, down, left, right etc based on where it is located.
//In more modern design concepts these have largely replaced popups.
//In dart/flutter the scaffold (topmost widget node in the nodetree) provides such a handy function in the form of a "drawer".
//One prominent example in windows is the notification pane in the taskbar.
class Flyout extends StatelessWidget
{
  const Flyout({super.key});

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
            onTap:(){},
            leading: const Icon(Icons.category_outlined),
            title: Text("Categories",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          ),
          ListTile(
            onTap:(){},
            leading: const Icon(Icons.food_bank_outlined),
            title: Text("Meals",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          ),
          ListTile(
            //To make these items interactive we need event handlers.
            onTap:(){},
            leading: const Icon(Icons.favorite_outline),
            title: Text("Favourites",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          ),
        ]
      )
    );
  }
}