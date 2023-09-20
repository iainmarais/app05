//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:flutter/material.dart";
import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:app05/Widgets/MealItemProp.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app05/DataProviders/FavouritesDataProvider.dart";

class MealItemDetailsScreen extends ConsumerWidget
{
  String SplitByComma(String input)
  {
    return input.split(", ").join("\n");
  }
  final MealItem_DataModel selectedMealItem;
  const MealItemDetailsScreen({super.key, required this.selectedMealItem});
  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final FavouriteMeals = ref.watch(FavouritesDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMealItem.Name} Details"),
        actions: [
          IconButton(
            onPressed: () 
            {
              //Trigger the notifier for the provider to update the state:

              final bool IsFavouriteItem = ref.read(FavouritesDataProvider.notifier).SetFavouriteState(selectedMealItem);
              //Clear any previous infobars:
              ScaffoldMessenger.of(context).clearSnackBars();
              //Show a info bar (snackbar) to the user informing them of the update:
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(IsFavouriteItem ? "${selectedMealItem.Name} saved to my favourites" : "${selectedMealItem.Name} removed from my favourites")));
            },
            //Swap the icon style based on the state of meal item being a favourite or not:
            icon: FavouriteMeals.contains(selectedMealItem) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
          )
        ]
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: NetworkImage(selectedMealItem.ImageUrl), height: 300,),
            const SizedBox(height: 10),
            Text("Ingredients:", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            const SizedBox(height: 10),
            for(int i = 0; i < selectedMealItem.Ingredients.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(selectedMealItem.Ingredients[i], textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            ),
            const SizedBox(height: 10),
            Text("Procedure:", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            const SizedBox(height: 10),
            for(int i = 0; i < selectedMealItem.Procedure.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(selectedMealItem.Procedure[i], textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            ),
            const SizedBox(height: 10),
            MealItemProp(myIcon: selectedMealItem.IsGlutenFree? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined, label: selectedMealItem.IsGlutenFree? "Gluten Free" : "Not Gluten Free"),
            MealItemProp(myIcon: selectedMealItem.IsLactoseFree? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined, label: selectedMealItem.IsLactoseFree? "Lactose Free" : "Not Lactose Free"),
            MealItemProp(myIcon: selectedMealItem.IsVegetarian? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined, label: selectedMealItem.IsVegetarian? "Vegetarian friendly" : "Not Vegetarian friendly"),
            MealItemProp(myIcon: selectedMealItem.IsVegan? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined, label: selectedMealItem.IsVegan? "Vegan friendly" : "Not Vegan friendly"),
          ]
        ),
      ),
    );
  }
}