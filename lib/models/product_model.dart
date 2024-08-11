import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String? productTitle;
  final String? productImage;
  final String? productPrice;
  final String? productDescription;
  final String? productCategory;
  final String? productId;
  final String? productQuantity;
  Timestamp? timestamp;
  ProductModel(
      {this.timestamp,
      this.productTitle,
      this.productImage,
      this.productPrice,
      this.productDescription,
      this.productCategory,
      this.productId,
      this.productQuantity});
  factory ProductModel.fromSnapshot(DocumentSnapshot doc) {
    final Data = doc.data() as Map;
    return ProductModel(
      timestamp: Data['timestamp'],
      productTitle: Data['productTitle'],
      productImage: Data['productImage'],
      productPrice: Data['productPrice'],
      productDescription: Data['productDescription'],
      productCategory: Data['productCategory'],
      productId: Data['productId'],
      productQuantity: Data['productQuantity'],
    );
  }
}
