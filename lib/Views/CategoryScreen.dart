//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:flutter/material.dart";
import "package:app05/DataSources/CategoryItem_SourceData.dart";
import "package:app05/Widgets/CategoryItem.dart";
import "package:app05/DataModels/CategoryItem_DataModel.dart";
import "package:app05/Views/MealItemScreen.dart";

//For meal testing:

class CategoryScreen extends StatelessWidget
{
  const CategoryScreen({required this.AvailableMeals, super.key});
  final List<MealItem_DataModel> AvailableMeals;
  //This is the function executed by the callback with the named arg OnSelectCategory.
  void _SelectCategory(BuildContext context, CategoryItem_DataModel category)
  {
    //Create a new var to hold the sorted list of meal items for this category
    final List<MealItem_DataModel> FilteredMealItems = AvailableMeals.where((element) => element.Categories.contains(category.Id)).toList();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MealItemScreen      (
        AppbarTitle: category.Name,
        AvailableMeals: FilteredMealItems,
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