

import 'package:admin_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
 List<ProductModel> _products=[];
List<ProductModel> get getProducts{

  return _products; 
} 

ProductModel? productsById(String productId) {
  return _products.firstWhere(
    (element) => element.productId == productId,
    
  );
}
List<ProductModel> productsByCategory(String category) {
    return _products
        .where((product) =>
            product.productCategory
                ?.toLowerCase()
                .contains(category.toLowerCase()) ??
            false)
        .toList();
  }
  final productDB=FirebaseFirestore.instance.collection('products');
  Stream<List<ProductModel>> FetchproductsStream(){

     try{
      return productDB.snapshots().map((snapshot){
      _products.clear();
      for (var doc in snapshot.docs) {
        _products.insert(0,ProductModel.fromSnapshot(doc));
      }
      return _products;
      });
    }catch(e){
      return Stream.empty();
     
    }
  
}
Future<void> deleteProduct(String productId) async {
    try {
      // Step 1: Fetch all users
      QuerySnapshot usersSnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (var userDoc in usersSnapshot.docs) {
        // Step 2: Get user data
        var userData = userDoc.data() as Map<String, dynamic>;

        // Step 3: Check if the product is in userCart
        if (userData['userCart'] != null) {
          List<dynamic> userCart = userData['userCart'];
          userCart
              .removeWhere((cartItem) => cartItem['productId'] == productId);

          // Update userCart in Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userDoc.id)
              .update({
            'userCart': userCart,
          });
        }

        // Step 4: Check if the product is in favoriteCart
        if (userData['favorite'] != null) {
          List<dynamic> favoriteCart = userData['favorite'];
          favoriteCart.removeWhere((favoriteItem) => favoriteItem['productId']== productId);

          // Update favoriteCart in Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userDoc.id)
              .update({
            'favorite': favoriteCart,
          });
          print('Product deleted successfully from favoriteCart');
        }
      }

      // Step 5: Delete the product from the products collection
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .delete();

      print('Product and associated entries deleted successfully');
    } catch (e) {
      print('Error deleting product: $e');
    }
  }



}
