//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
//System namespaces
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
//Models
import "package:app05/DataModels/MealItem_DataModel.dart";
//Data sources
import "package:app05/DataSources/MealItem_SourceData.dart";
//Views and Widgets
import "package:app05/Views/CategoryScreen.dart";
import "package:app05/Views/MealItemScreen.dart";
import "package:app05/Widgets/Flyout.dart";
import "package:app05/Views/FiltersScreen.dart";
//Data Providers
import "package:app05/DataProviders/MealDataProvider.dart";
import "package:app05/DataProviders/FavouritesDataProvider.dart";
import "package:app05/DataProviders/FilterProvider.dart";


//Tab navigation bar - stateful (manages its own state)
class TabBarScreen extends ConsumerStatefulWidget
{
  const TabBarScreen({super.key});
  @override
  ConsumerState<TabBarScreen> createState() => _TabBarScreenState();
}

//State handler class:
class _TabBarScreenState extends ConsumerState<TabBarScreen>
{
  int _selectedIndex = 0;
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
        await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (context) => const FiltersScreen())); 
        //If the result is not an empty dictionary, or is not null, assign it as the value of our dictionary of states.
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
  void _SelectPage(int index)
  {
    setState(() {_selectedIndex = index;});
  }

  @override
  Widget build(BuildContext context)
  {
    final allMeals = ref.watch(MealDataProvider);
    //Create a new var to be used for the filtering of the meal items based on the user's filters:
    final FilteredMealItems = ref.watch(FilteredMealItemsProvider);
    Widget ActivePage = CategoryScreen(AvailableMeals: FilteredMealItems);
    String ActivePageTitle = "Categories";
    if(_selectedIndex == 1)
    {
      final myFavourites = ref.watch(FavouritesDataProvider);
      ActivePage = MealItemScreen(AvailableMeals: myFavourites);
      ActivePageTitle = "Favourites";
    }
    else if (_selectedIndex == 2)
    {
      ActivePage = MealItemScreen(AvailableMeals: allMeals);
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