import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  @override
 final TextEditingController searchController;

  Search_Bar({required this.searchController});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        child: TextField(
          style: TextStyle(color: Colors.black), // This sets the text color
          onChanged: (value) {
            print("$searchController.text");
          },
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffix: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
              },
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15.0),
          ),
        ),
      ),
    );
  }
}
