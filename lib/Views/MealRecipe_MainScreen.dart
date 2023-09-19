//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

//use double quoted strings.
//Avoid duck typing like the plague - it causes hell, problems and is plain fugly, and makes you look dof.
//For the uninitiated, "dof" is a south african slang word for dull, daft or stupid, or idiotic.
//Curly brackets on new lines, except when using them to create a block of values for a list.

//System namespaces
import "package:flutter/material.dart";

//Program specific namespaces
import "package:app05/Views/TabBarScreen.dart";

//App theme - declared here at the top-level class not in the system entry point code file or class
final ThemeData theme = ThemeData(
  //Using default widget theme from Flutter.
  //Ideally I want to be able to use the Aero design language from Windows 7 which is superior in every single way to what's out there now.
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 131, 57, 0),
                                    brightness: Brightness.dark),
);

class MealRecipe_MainScreen extends StatelessWidget
{
  const MealRecipe_MainScreen({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: theme,
      home: const TabBarScreen(),
    );
  }
}