//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types


//Gonna need this data model for this class, might as well grab the dataset too.
import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:flutter/material.dart";
import "package:app05/Widgets/MealItem.dart";
import "package:app05/Views/MealRecipe_MealItemDetailsScreen.dart";

//This will serve as the entry point for each category item screen to be displayed.
class MealRecipe_MealItemScreen extends StatelessWidget
{
  //Here the code takes in the context and a meal item datamodel instance
  void _ViewDetails(BuildContext context, MealItem_DataModel selectedMealItem)
  {
    //No need to filter anything out so use the arg passed in
    Navigator.push(context, MaterialPageRoute(
      builder: (context)
      {
        return MealRecipe_MealItemDetailsScreen(
          selectedMealItem: selectedMealItem,
          SetIsFavourite: SetFavourite,
        );
      }
    ));
  }
  final String? AppbarTitle;
  final List<MealItem_DataModel> AvailableMeals;
  final void Function(MealItem_DataModel selectedMealItem) SetFavourite;
  const MealRecipe_MealItemScreen({this.AppbarTitle, required this.SetFavourite ,required this.AvailableMeals, super.key});
  @override
  Widget build(BuildContext context)
  {
    Widget Content=AvailableMeals.isEmpty 
      ? Center(
          child:Column(
            //Constrain this column so that it does not eat up all our precious space.
            mainAxisSize: MainAxisSize.min,
          children: [
            Text("Could not find any meals!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground)),
            const SizedBox(height: 20),
            Text("Try adding some, or try a different category.",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground)),
          ],
        )
      ) 
      :(ListView.builder(itemCount: AvailableMeals.length,itemBuilder:(context, index) => 
        MealItem(MealItemData:AvailableMeals[index], ViewDetails: (MealItemData)
          {
            _ViewDetails(context, MealItemData);}
          )
        )
      );
    //Conditionally render the full scaffold if the appbar title is not null, else render only the content:
    if (AppbarTitle == null)
    {
      return Content;
    }
    else
    {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppbarTitle!),
        ),
        body: Content
        //
      );
    }
  }
}