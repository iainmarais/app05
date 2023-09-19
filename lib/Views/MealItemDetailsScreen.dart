//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:flutter/material.dart";
import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:app05/Widgets/MealItemProp.dart";

class MealItemDetailsScreen extends StatelessWidget
{
  String SplitByComma(String input)
  {
    return input.split(", ").join("\n");
  }
  final MealItem_DataModel selectedMealItem;
  final void Function(MealItem_DataModel selectedMealItem) SetIsFavourite;
  const MealItemDetailsScreen({super.key, required this.SetIsFavourite, required this.selectedMealItem});
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMealItem.Name} Details"),
        actions: [
          IconButton(
            onPressed: () 
            {
              SetIsFavourite(selectedMealItem);
            },
            icon: const Icon(Icons.favorite),
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