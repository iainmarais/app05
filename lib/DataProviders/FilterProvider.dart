//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app05/DataProviders/MealDataProvider.dart";

//This class will manage the filters dictionary:
//Dictionaries are created using the Map<> constructor.
enum Filter 
{
  IsGlutenFree,
  IsLactoseFree,
  IsVegetarianFriendly,
  IsVeganFriendly
}

class /// `FilterNotifier` is a class that extends `StateNotifier` from the `flutter_riverpod` package.
/// It manages a dictionary of filters, where each filter is represented by an enum value from the
/// `Filter` enum. The initial state of the filters is set to `false` for all filters.
FilterNotifier extends StateNotifier<Map<Filter, bool>>
{
  FilterNotifier() : super(
    {
      Filter.IsGlutenFree: false,
      Filter.IsLactoseFree: false,
      Filter.IsVegetarianFriendly: false,
      Filter.IsVeganFriendly: false
    });
  /// The `SetFilterState` method is used to update the state of a specific filter in the
  /// `FilterNotifier` class. It takes two parameters: `thisFilter` which represents the filter to be
  /// updated, and `filterState` which represents the new state of the filter (either `true` or
  /// `false`).
  void SetFilterState(Filter thisFilter, bool filterState)
  {
    state = {...state, thisFilter: filterState};
  }
  void SetAllFilterStates(Map<Filter, bool> filters)
  {
    state = filters;
  }
}


/// `final FilterProvider = StateNotifierProvider<FilterNotifier,Map<Filter, bool>>((ref) =>
/// FilterNotifier());` is creating a provider called `FilterProvider` using the `StateNotifierProvider`
/// class from the `flutter_riverpod` package.
final FilterProvider = StateNotifierProvider<FilterNotifier,Map<Filter, bool>>((ref) => FilterNotifier());


final FilteredMealItemsProvider = Provider((ref)
{
  final allMeals = ref.watch(MealDataProvider);
  final activeFilters = ref.watch(FilterProvider);
  
  return allMeals.where((element)
    {
      if(activeFilters[Filter.IsGlutenFree]! && !element.IsGlutenFree)
      {
        return false;
      }
      if(activeFilters[Filter.IsLactoseFree]! && !element.IsLactoseFree)
      {
        return false;
      }
      if(activeFilters[Filter.IsVegetarianFriendly]! && !element.IsVegetarian)
      {
        return false;
      }
      if(activeFilters[Filter.IsVeganFriendly]! && !element.IsVegan)
      {
        return false;
      }
      return true;
    }).toList();
});