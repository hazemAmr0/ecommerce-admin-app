import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final Timestamp orderDate;
  final String address;
  late final String status;
  final String totalPrice;
  final String orderId;
  final String productId;
  final String userId;
  final String price;
  final String ProductName;
  final String quantity;
  final String imageUrl;
  final String userName;

  OrderModel({
    required this.orderDate,
    required this.address,
    required this.status,
    required this.totalPrice,
    required this.orderId,
    required this.productId,
    required this.userId,
    required this.price,
    required this.ProductName,
    required this.quantity,
    required this.imageUrl,
    required this.userName,
  });

  OrderModel copyWith({
    Timestamp? orderDate,
    String? address,
    String? status,
    String? totalPrice,
    String? orderId,
    String? productId,
    String? userId,
    String? price,
    String? ProductName,
    String? quantity,
    String? imageUrl,
    String? userName,
  }) {
    return OrderModel(
      orderDate:  orderDate ?? this.orderDate,
      address: address ?? this.address,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      price: price ?? this.price,
      ProductName: ProductName ?? this.ProductName,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      userName: userName ?? this.userName,
    );
  }
}
