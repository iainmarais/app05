//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:app05/Views/MealRecipe_CategoryScreen.dart";
import "package:app05/Views/MealRecipe_MealItemScreen.dart";
import "package:app05/Widgets/Flyout.dart";
import "package:flutter/material.dart";

//Create the TabBar class as a stateful widget to be used in the MealRecipe_MainScreen
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
  //Declaring this as static (final) means it is not instantiated every time it is used.
  final List<MealItem_DataModel> MyFavourites = [];

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
    Widget ActivePage = MealRecipe_CategoryScreen(SetFavourite: ManageFavouriteStatus,);
    String ActivePageTitle = "Categories";
    if(_selectedIndex == 1)
    {
      ActivePage = MealRecipe_MealItemScreen(SetFavourite: ManageFavouriteStatus ,AvailableMeals: MyFavourites);
      ActivePageTitle = "Favourites";
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(ActivePageTitle),
      ),
      drawer: const Flyout(),
      body: ActivePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _SelectPage,
        items: const [
          //I use british spelling. Bite me.
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "Favourites"),
        ],
      )
    );
  }
}