import 'dart:math';

import 'package:admin_app/constants/colors/App_color.dart';
import 'package:admin_app/core/widgets/shimmer.dart';
import 'package:admin_app/models/product_model.dart';
import 'package:admin_app/providers/product_provider.dart';
import 'package:admin_app/screens/search/widgets/app_bar_widget.dart';
import 'package:admin_app/screens/search/widgets/item_card.dart';
import 'package:admin_app/screens/search/widgets/search_delegate.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, this.categoryName,});

  late TextEditingController searchController=  TextEditingController();

  final String?categoryName;

  @override
  Widget build(BuildContext context) {
    
    final productProvider = Provider.of<ProductProvider>(context);
   List<ProductModel> CategoryList =categoryName==null?productProvider.getProducts: productProvider.productsByCategory(categoryName!); 

    return Scaffold(

      // body: CategoryList.isEmpty
      //     ? Container()
         body  : StreamBuilder<List<ProductModel>>(
            stream: productProvider.FetchproductsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerCart();
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              }
              if(snapshot.data==null){
                  return Center(
                  child: Text('No Products Found'));
              }
              return SafeArea(
                      child: Column(
              children: [
                   AppBarWidget(productProvider: productProvider,),
              Expanded(
                child: DynamicHeightGridView(builder: (context,index){
                  return  ItemCard(
                    productId: CategoryList[index].productId??'',
                  );
                  
                 
                }, itemCount: CategoryList.length, crossAxisCount: 2),
              )
              ],
                      ),
                    );
            }
          ),
    );
  }
}







