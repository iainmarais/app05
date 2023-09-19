//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names

import "package:app05/DataModels/MealItem_DataModel.dart";

 const MealItems =
[
  //Data source for an Italian timeless classic - Spaghetti Bolognese.
  MealItem_DataModel(
    MealItemId: "m1",
    Categories: [
      "C1","C2"
    ],
    Name: "Spaghetti Bolognese",  //Face it, 'tomato sauce' just won't cut it. This IS Italian-style after all.
    ImageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg",
    affordability: Affordability.inexpensive,
    complexity: Complexity.simple,
    Ingredients: [
      "Tomato puree",
      "Can of Italian whole tomatoes, dependent on servings to prepare",
      "Fresh beef mince, depending on servings to prepare",
      "Oil, preferably olive oil",
      "1 to 2 onions",
      "Spaghetti (amount dependent on servings to prepare)",
      "Spices and herbs",
      "Cheese (optional)"
    ],
    //Renamed this from duration to PrepTime as it better reflects what's actually going on.
    PrepTime: 35,
    Procedure: [
      "Fry up some onion rings and unspiced ground beef mince in some oil, preferably olive oil.",
      "Cook for 15 minutes or so, until the mince is cooked through.",
      "Cut the tomatoes into small pieces and add to the mince.",
      "Season to your preference with salt, pepper, and italian herbs",
      "Add a generous amount of salt to a pot of water and bring to the boil.",
      "Put the spaghetti into the now boiling water - it will be done in around 10 to 12 minutes.",
      "After 2 minutes, add the tomato pieces, salt, pepper and your other spices.",
      "The bolognese will be done once the spaghetti is.",
      "Feel free to add some cheese on top of the finished dish.",
    ],
    IsGlutenFree: false,
    IsLactoseFree: false,
    IsVegan: false,
    IsVegetarian: false
  ),
  //Data source for a good old-fashioned hamburger
  MealItem_DataModel(
    MealItemId: "m2",
    Categories: [
      "C2","C3",
    ],
    Name: "Hamburger",
    ImageUrl: "https://upload.wikimedia.org/wikipedia/commons/4/47/Hamburger_(black_bg).jpg",
    affordability: Affordability.inexpensive,
    complexity: Complexity.simple,
    Ingredients: [
      "(per unit:)",
      "200g to 300g Beef mince, depending on preference",
      "1 large egg",
      "salt and pepper",
      "1 tomato",
      "1 Onion",
      "Lettuce leaves",
      "Tomato sauce",
      "Cheese (optional)",
      "Hamburger roll - cut in half",
    ],
    PrepTime: 45,
    Procedure: [
      "Mix up the beef mince, 1 egg, salt and pepper",
      "Form the mixed mince into a large burger patty",
      "Fry the burger patty on both sides, for a minimum of 4 minutes on high heat",
      "Optionally, place a slice of cheese onto the patty while frying for a cheesy burger",
      "Lightly toast the hamburger roll halves (optional)",
      "Spread the roll with butter",
      "Place sliced onion, tomato, and lettuce leaves onto one half of the hamburger roll",
      "Place the burger patty on top of the other ingredients, then place the other half on top of it",
      "Serve with fried potato chips",
    ],
    IsGlutenFree: false,  //Well what else is gonna hold that burger roll together?
    IsLactoseFree: true,  //or false depending on how the rolls are made.
    IsVegan: false,       //Oh hell no! This is a burger! Us burger munchers don't do plant-based. That would be sacrilege!
    IsVegetarian: false   //Not on your bloody life!
  ),
  //French toast
  MealItem_DataModel(
    MealItemId: "m3",
    Categories: [
      "C2","C5","C7",
    ],
    Name: "French toast",
    ImageUrl: "https://upload.wikimedia.org/wikipedia/commons/4/42/FrenchToast.JPG",
    affordability: Affordability.inexpensive,
    complexity: Complexity.simple,
    Ingredients: [
      "2 or more slices of bread, per serving",
      "2 eggs",
      "Milk",
      "Any vegetable oil",
      "Maple syrup",
    ],
    PrepTime: 10,
    Procedure: [
      "Mix the eggs with some milk.",
      "Dip the bread into the egg mixture.",
      "Pour just enough oil into a frying pan until it covers the base.",
      "Fry the french toast at high heat, turning it over to avoid burning.",
      "Serve with maple syrup.",
      ],
    IsGlutenFree: false,
    IsLactoseFree: false, //Milk more often than not contains lactose.
    IsVegan: false,       //Not likely. These guys are super strict that they will even avoid eggs.
    IsVegetarian: true    //Depending on the regime of the vegetarian. Most vegetarians do use dairy products.
  ),
  //Pizza - modern global variant will be used here
  MealItem_DataModel(
    MealItemId: "m4",
    Categories: [
      "C2","C3",
    ],
    Name: "Pizza",
    ImageUrl: "https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg",
    affordability: Affordability.inexpensive,
    complexity: Complexity.simple,
    Ingredients: [
      "Per serving:",
      "Tomato puree - thinned down",
      "Mozarella cheese",
      "Pizza base - large or standard",
      "Any other toppings you like",
    ],
    PrepTime: 15,
    Procedure: [
      "Thin down the tomato puree with some water.",
      "Spread the tomato puree on the pizza base.",
      "Add any desired toppings.",
      "Distribute a generous amount of Mozarella cheese over the top.",
      "Bake for 15 minutes or so at high heat (around 200C).",
      "Serve hot, with any desired sauce on the side.",
    ],
    IsGlutenFree: false,    //Wheat flour is a common ingredient in pizza bases.
    IsLactoseFree: false,   //Usually false: cheese is a dairy product after all...
    IsVegan: false,         //Conditionally. 
    IsVegetarian: false     //Conditionally.
  ),
  //Add more entries as needed.
];
