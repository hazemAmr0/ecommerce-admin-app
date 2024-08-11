import 'package:admin_app/models/product_model.dart';
import 'package:admin_app/screens/search/widgets/item_card.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSearchDelegate extends SearchDelegate<String> {
  final List<ProductModel>
      categoryList; // Assuming dynamic for simplicity, replace with your actual type

  ProductSearchDelegate({required this.categoryList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // You can show search results here if you want to navigate to a new page with the result
    return Center(
      child: Container(
     
       child: Image.asset('assets/images/empty_search.png',scale: 2,fit: BoxFit.cover,),
      ),
    );
    
      }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = categoryList.where((product) {
      // Assuming product has a 'name' field for filtering, replace with actual field
      return product.productTitle!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    
        return DynamicHeightGridView(
        
          builder: (BuildContext context, int index) { 
           final suggestion = suggestions[index];
            return
               ItemCard(
                productId: suggestion.productId!,
              );
          }, itemCount: suggestions.length, crossAxisCount: 2,
        );
          
       
    
  
  }
}

