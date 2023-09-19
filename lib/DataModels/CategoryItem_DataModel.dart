//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:flutter/material.dart";

//Since this will not handle any sort of element or widget on its own, there is no need to use these namespaces.
//This class is simply responsible for setting up the data for category item instances.

class CategoryItem_DataModel
{
  //Constructor
  const CategoryItem_DataModel({required this.Name, required this.Id, this.colour = Colors.orange});
  //Props
  final String Name;
  final String Id;
  final Color colour; 
}