//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

//This statenotifier class requires the use of the respective datamodel for which it will build out a usable state dataset
import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


class FavouritesDataNotifier extends StateNotifier<List<MealItem_DataModel>>
{
  //This value used as an arg for the super() constructor should/must never be modified.
  FavouritesDataNotifier() : super([]);

  bool SetFavouriteState(MealItem_DataModel thisMealItem)
  {
    final bool IsFavourite = state.contains(thisMealItem);
    //Create a new list/array:
    if (IsFavourite == true)
    {
      //Since the original state can't be modified, a new version with the appropriate changes has to be created and assigned to the original var.
      state = state.where((x) => x.MealItemId != thisMealItem.MealItemId).toList();
      return false;
    }
    else 
    {
      state = [...state, thisMealItem];
      return true;
    }
  }
}

//Please note: Strong typing, leads to type safety and by extension memory safety.

//Note that here one can use datatype inference.
//The lambda expression here is similar to a javascript/c# arrow function in that it returns a value.
final FavouritesDataProvider = StateNotifierProvider<FavouritesDataNotifier,List<MealItem_DataModel>>((ref) => FavouritesDataNotifier());