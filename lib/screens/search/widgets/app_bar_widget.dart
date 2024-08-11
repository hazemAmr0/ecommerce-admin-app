import 'package:admin_app/screens/search/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AppBarWidget extends StatelessWidget {
   AppBarWidget({super.key,required this.productProvider });
  var productProvider;
  @override
  Widget build(BuildContext context) {
    return  Container(
       padding: const EdgeInsets.all(20.0),
       child: Row(
         children: [
           GestureDetector(
             onTap: () {
               Navigator.pop(context);
             },
             child: Icon(
               IconlyLight.arrowLeft2,
               color: Colors.white,
             ),
           ),
           SizedBox(width: 20),
          Text('Products',style: TextStyle(color: Colors.white,fontSize: 20),),
            Spacer(),
            IconButton(
              onPressed: () {
               
                showSearch(
                    context: context,
                    delegate: ProductSearchDelegate(categoryList: productProvider.getProducts));
              },
              icon: Icon(
                IconlyLight.search,
                color: Colors.white,
              ),
            ),
         ]
       ),
     );
  }
}