

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
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .delete();
      print('Product deleted successfully');
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

}
