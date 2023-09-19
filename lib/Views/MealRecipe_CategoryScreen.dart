//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:flutter/material.dart";
import "package:app05/DataSources/CategoryItem_SourceData.dart";
import "package:app05/Widgets/CategoryItem.dart";
import "package:app05/DataModels/CategoryItem_DataModel.dart";
import "package:app05/Views/MealRecipe_MealItemScreen.dart";

import "package:app05/DataSources/MealItem_SourceData.dart";

//For meal testing:

class MealRecipe_CategoryScreen extends StatelessWidget
{
  const MealRecipe_CategoryScreen({required this.SetFavourite,super.key});
  final void Function(MealItem_DataModel selectedMealItem) SetFavourite;
  //This is the function executed by the callback with the named arg OnSelectCategory.
  void _SelectCategory(BuildContext context, CategoryItem_DataModel category)
  {
    //Create a new var to hold the sorted list of meal items for this category
    final List<MealItem_DataModel> FilteredMealItems = MealItems.where((element) => element.Categories.contains(category.Id)).toList();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MealRecipe_MealItemScreen(
        AppbarTitle: category.Name,
        AvailableMeals: FilteredMealItems,
        SetFavourite: SetFavourite
      )
    ));
  }

  @override
  Widget build(BuildContext context)
  {
    //use safe area
    return GridView(
        //Padding of 16 on all sides:
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                                                    childAspectRatio: 3 / 2,
                                                                    crossAxisSpacing: 20,
                                                                    mainAxisSpacing:20 ),
        children: AvailableCategories.map((thisElement) => CategoryItem(categoryItemData: thisElement, OnSelectCategory: () 
        {_SelectCategory(context, thisElement);}
        )).toList(),
      ); 
  }
}