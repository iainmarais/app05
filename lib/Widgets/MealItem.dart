//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names
import "package:flutter/material.dart";
import "package:app05/DataModels/MealItem_DataModel.dart";
import "package:transparent_image/transparent_image.dart";
import "package:app05/Widgets/MealItemProp.dart";

class MealItem extends StatelessWidget
{
  const MealItem({super.key, required this.MealItemData, required this.ViewDetails});
  final MealItem_DataModel MealItemData;
  //By using an argument here, this callback helps simplify the function and execution in the class using this widget object.
  final void Function(MealItem_DataModel selectedMealItem) ViewDetails;

  //Using this method to convert to title case helps eliminate unnecessary duplication of this function since it can be used on any source string.
  String ToTitleCase(String src)
  {
    var words = src.split(" ");
    if(words.length > 1)
    {
      for (int i = 0; i < words.length; i++)
      {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    } 
    else
    {
      words[0] = words[0][0].toUpperCase() + words[0].substring(1);
    } 
    //Join the resulting words into a new string separated by whitespace:
    return words.join(" ");
    //The use of the add (+) operator here is not for adding, but concatenation (in simple english this is chaining together multiple sub-elements)
  }
  String ToSentenceCase(String src)
  {
    //Capitalise the first letter of the first word of the string. The string is terminated by a period (.) followed by a null terminator (\0).
    var words = src.split(" ");
    words[0] = words[0][0].toUpperCase() + words[0].substring(1);
    return words.join(" ");
  }

  @override
  Widget build(BuildContext context)
  {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        child: InkWell(
          //This is the reference to the callback declared in the class definition above.
          onTap: (){ViewDetails(MealItemData);},
          child: Stack(
            children: [
              FadeInImage(placeholder: MemoryImage(kTransparentImage), 
                          image: NetworkImage(MealItemData.ImageUrl), 
                          fit: BoxFit.cover,
                          height: 500,
                          width: double.infinity),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child:Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(horizontal:16, vertical: 4),
                  child: Column(
                    children: [
                  Text(MealItemData.Name, maxLines: 2, textAlign: TextAlign.center,softWrap: true,overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.white )),
                      const SizedBox(height: 10),
                      Row(
                        //To ensure that these elements are in the centre of the space, we must center the main axis alignment:
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Always give the name of the associated property to the user. Not everyone understands pictogram visual language.
                          //Such minimalism is idiotic and unnecessary, and causes confusion and delay.
                          //Note that timelapse is a better representation for this prop instance since it is a time period needed to prepare the meal
                          MealItemProp(myIcon: Icons.timelapse, label: "Preparation time: ${MealItemData.PrepTime} minutes"),
                          const SizedBox(width: 8),
                          //Note that the complexity is an enum, as such we need to access the name prop of that enum using a get accesor on the name property.
                          MealItemProp(myIcon: Icons.bar_chart, label: "Complexity: ${ToTitleCase(MealItemData.complexity.name)}"),
                          const SizedBox(width: 8),
                          MealItemProp(myIcon: Icons.check_box_outlined, label: "Affordability: ${ToTitleCase(MealItemData.affordability.name)}"),
                          //MealItemProp: show the ingredients list: 
                        ],
                      )
                    ]
                  )
                )
              )
            ],
          ),
        )
      );
  }
}