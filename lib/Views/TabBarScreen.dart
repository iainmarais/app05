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

//State handler class:
class _TabBarScreenState extends State<TabBarScreen>
{
  int _selectedIndex = 0;
  //Declaring this as readonly (dart:final) means it is not instantiated every time it is used.
  final List<MealItem_DataModel> MyFavourites = [];
  final List<MealItem_DataModel> AllMeals = MealItems;

  void LoadScreenByName(String ScreenName)
  {
    //By adding the Navigator.pop(context) here, the flyout is dismissed whenever the loaded screen change is executed.
    Navigator.pop(context);
    switch(ScreenName)
    {
      case "Categories":
        _SelectPage(0);
        break;
      case "Filters":
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FiltersScreen()));
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
    Widget ActivePage = CategoryScreen(SetFavourite: ManageFavouriteStatus,);
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