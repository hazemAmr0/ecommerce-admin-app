import 'package:flutter/material.dart';

class AppConst{

static List<String> categoryList = [
    'Phones',
    'Laptops',
    'Electronics',
    'Watches',
    'Clothes',
    'Shoes',
    'Books',
    'Cosmetics',
    "Accessories",
];
  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      categoryList.length,
      (index) => DropdownMenuItem(
        value: categoryList[index],
        child: Text(
          categoryList[index],
        ),
      ),
    );
    return menuItems;
  }
    //want list of statues




  static List<String> statueList = [
    'pending',
    'processing',
    'shipped',
    'cancelled',
    'delivered',
    // Add more statues as needed
  ];

  static List<DropdownMenuItem<String>>? get statueDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      statueList.length,
      (index) => DropdownMenuItem(
        value: statueList[index],
        child: Text(
          statueList[index],
        ),
      ),
    );
    return menuItems;
  }

}