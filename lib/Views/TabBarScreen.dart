//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:app05/DataSources/MealItem_SourceData.dart";
import "package:app05/Views/CategoryScreen.dart";
import "package:app05/Views/MealItemScreen.dart";
import "package:app05/Widgets/Flyout.dart";
import "package:app05/Views/FiltersScreen.dart";
import "package:flutter/material.dart";

//Tab navigation bar - stateful (manages its own state)
class TabBarScreen extends StatefulWidget
{
  const TabBarScreen({super.key});
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

//Reuse the dictionary, with a new name as an initialiser and fallback for the user filters state. 
//This dictionary should be readonly.

//Once again, I use explicitly named vars for readability and ease of understanding.
//I also use strongly typed vars everywhere except for locally scoped vars.

  const Map<FilterOptions, bool> GlobalInitialFilters = 
  {
    //Initial states:
    FilterOptions.IsGlutenFree: false,
    FilterOptions.IsLactoseFree: false,
    FilterOptions.IsVegetarianFriendly: false,
    FilterOptions.IsVeganFriendly: false
  };

//State handler class:
class _TabBarScreenState extends State<TabBarScreen>
{
  int _selectedIndex = 0;
  //Add the dictionary for the filters here: 
  Map<FilterOptions, bool> UserFilters = 
  {
    //Initial states:
    FilterOptions.IsGlutenFree: false,
    FilterOptions.IsLactoseFree: false,
    FilterOptions.IsVegetarianFriendly: false,
    FilterOptions.IsVeganFriendly: false
  };
  //Declaring this as readonly (dart:final) means it is not instantiated every time it is used.
  final List<MealItem_DataModel> MyFavourites = [];
  final List<MealItem_DataModel> AllMeals = MealItems;

  void LoadScreenByName(String ScreenName) async
  {
    //By adding the Navigator.pop(context) here, the flyout is dismissed whenever the loaded screen change is executed.
    Navigator.pop(context);
    switch(ScreenName)
    {
      case "Categories":
        _SelectPage(0);
        break;
      case "Filters":
      //Pull in the data from the async task in the filters screen class.
      final result = await Navigator.push<Map<FilterOptions, bool>>(context, MaterialPageRoute(builder: (context) => FiltersScreen(currentFilters:UserFilters))); 
        //If the result is not an empty dictionary, or is not null, assign it as the value of our dictionary of states.
        setState(() 
        {
          //Should the state of the result be empty or null, use the initial filters dictionary as a fallback.
          UserFilters = result ?? GlobalInitialFilters;
        });
        //Will now have to somehow keep these states at their last value when they return and when the user reenters the filters screen so that they are not lost...
        
        break;
      case "Favourites":
        _SelectPage(1);
        break;
      case "All":
        _SelectPage(2);
        break;
    }
  }

  void ShowUpdateMessage(String message)
  {
    //Clear any previous infobars:
    ScaffoldMessenger.of(context).clearSnackBars();
    //Show a info bar (snackbar) to the user informing them of the update:
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  void ManageFavouriteStatus(MealItem_DataModel selectedMealItem)
  {
    bool IsFavourite = MyFavourites.contains(selectedMealItem);
    if(IsFavourite)
    {
      setState(() {MyFavourites.remove(selectedMealItem);});
      ShowUpdateMessage("${selectedMealItem.Name} removed from favourites");
    }
    else
    {
      setState(() {MyFavourites.add(selectedMealItem);});
      ShowUpdateMessage("${selectedMealItem.Name} added to favourites");
    }
  }
  void _SelectPage(int index)
  {
    setState(() {_selectedIndex = index;});
  }

  @override
  Widget build(BuildContext context)
  {
    //Create a new var to be used for the filtering of the meal items based on the user's filters:
    final FilteredMealItems = AllMeals.where((element)
    {
      if(UserFilters[FilterOptions.IsGlutenFree]! && !element.IsGlutenFree)
      {
        return false;
      }
      if(UserFilters[FilterOptions.IsLactoseFree]! && !element.IsLactoseFree)
      {
        return false;
      }
      if(UserFilters[FilterOptions.IsVegetarianFriendly]! && !element.IsVegetarian)
      {
        return false;
      }
      if(UserFilters[FilterOptions.IsVeganFriendly]! && !element.IsVegan)
      {
        return false;
      }
      return true;
    }).toList();
    Widget ActivePage = CategoryScreen(AvailableMeals: FilteredMealItems, SetFavourite: ManageFavouriteStatus,);
    String ActivePageTitle = "Categories";
    if(_selectedIndex == 1)
    {
      ActivePage = MealItemScreen(SetFavourite: ManageFavouriteStatus ,AvailableMeals: MyFavourites);
      ActivePageTitle = "Favourites";
    }
    else if (_selectedIndex == 2)
    {
      ActivePage = MealItemScreen(SetFavourite: ManageFavouriteStatus, AvailableMeals: AllMeals);
      ActivePageTitle = "All";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(ActivePageTitle),
      ),
      drawer: Flyout(
        LoadScreen: LoadScreenByName,
      ),
      body: ActivePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _SelectPage,
        items: const [
          //I use british spelling. Bite me.
          BottomNavigationBarItem(icon: Icon(Icons.checklist_outlined),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "Favourites"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_outlined),label: "All"),
        ],
      )
    );
  }
}