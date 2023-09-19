//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types


//System namespaces
import "package:flutter/material.dart";

//Program specific namespaces
import "package:app05/Views/TabBarScreen.dart";

//App theme - declared here at the top-level class not in the system entry point code file or class
final ThemeData theme = ThemeData(
  //Using default widget theme from Flutter.
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