//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names
import "package:flutter/material.dart";
import "package:app05/DataModels/CategoryItem_DataModel.dart";

class CategoryItem extends StatelessWidget
{
  const CategoryItem({Key? key, required this.categoryItemData, required this.OnSelectCategory}) : super(key: key);
  final CategoryItem_DataModel categoryItemData;
  
  //This serves as the callback for the OnSelectCategory
  final void Function()? OnSelectCategory;

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      //Note to self: this is a reference to the above void Function() arg named OnSelectCategory.
      onTap: OnSelectCategory,
      //Use the primary colour from the colour theme as the splash colour
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        //Add a padding of 8 on all sides
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: RadialGradient(
            colors: [
              categoryItemData.colour.withOpacity(1.0), 
              categoryItemData.colour.withOpacity(0.75)
            ]
          ),
        ),
        child: Center(child: Text(categoryItemData.Name, 
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground)
                        )
                      ),
      ),
    );
  }
}