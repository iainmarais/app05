//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
enum Complexity{simple,easy,moderate,hard}
enum Affordability{inexpensive,moderate,expensive,exclusive}


class MealItem_DataModel
{
  //Constructor
  //Using named args is a far more easier when dealing with large datasets.
  const MealItem_DataModel
  ({
    required this.MealItemId,
    required this.Categories,
    required this.Name,
    required this.ImageUrl,
    required this.Ingredients,
    required this.Procedure,
    required this.PrepTime,
    required this.complexity,
    required this.affordability,
    required this.IsGlutenFree,
    required this.IsLactoseFree,
    required this.IsVegan,
    required this.IsVegetarian
  });
  //Props:
  final String MealItemId;
  final List<String> Categories;
  final String Name;
  final String ImageUrl;
  final List<String> Ingredients;
  final List<String> Procedure;
  final int PrepTime;
  final Complexity complexity;
  final Affordability affordability;
  final bool IsGlutenFree;
  final bool IsLactoseFree;
  final bool IsVegan;
  final bool IsVegetarian;
}