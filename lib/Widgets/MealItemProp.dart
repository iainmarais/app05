//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types

//To anyone reading my source: 
//Please be aware that I use the exact same name and case for my classname and filename, by design.
//This is intentional.

import "package:flutter/material.dart";

class MealItemProp extends StatelessWidget
{
  //Constructor:  add any props created below to this as well.
  const MealItemProp({super.key, required this.myIcon, required this.label});
  //Add any props we need here
  final IconData myIcon;
  final String label;

  //Need this method, as always.
  @override
  Widget build(BuildContext context) 
  {
    return(
      Row(
        children: [
          Icon(myIcon, size:18, color: Colors.white,),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white),)
        ]
      )
    );
  }
}