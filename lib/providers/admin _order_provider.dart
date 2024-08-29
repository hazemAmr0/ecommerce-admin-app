import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List of all orders
  final List<OrderModel> _orders = [];

  // Fetch orders and convert them to OrderModel objects
  Future<void> fetchOrders() async {
    try {
      final orderSnapshot =
          await _firestore.collectionGroup('userOrders').get();
      final List<OrderModel> fetchedOrders = [];
      for (var element in orderSnapshot.docs) {
        fetchedOrders.add(OrderModel(
          orderDate: element.get('orderDate'),
          address: element.get('address'),
          status: element.get('orderStatus'),
          totalPrice: element.get('totalPrice').toString(),
          orderId: element.get('orderId'),
          productId: element.get('productId'),
          userId: element.get('userId'),
          price: element.get('price').toString(),
          ProductName: element.get('product title').toString(),
          quantity: element.get('quantity').toString(),
          imageUrl: element.get('imageUrl'),
          userName: element.get('username'),
        ));
      }
      _orders.clear();
      _orders.addAll(fetchedOrders);
      notifyListeners();
    } catch (e) {
      print('Error fetching orders: $e');
      rethrow;
    }
  }

  List<OrderModel> get getOrders => _orders;

  // Get orders by specific status
  List<OrderModel> getProcessingOrders() {
    return _orders.where((order) => order.status == 'Processing').toList();
  }

  List<OrderModel> getShippedOrders() {
    return _orders.where((order) => order.status == 'Shipped').toList();
  }

  List<OrderModel> getDeliveredOrders() {
    return _orders.where((order) => order.status == 'Delivered').toList();
  }

  List<OrderModel> getCancelledOrders() {
    return _orders.where((order) => order.status == 'Cancelled').toList();
  }

  // Stream for listening to real-time changes for each order status
  Stream<List<OrderModel>> getOrdersStreamByStatus(String status) {
    return _firestore
        .collectionGroup('userOrders')
        .where('orderStatus', isEqualTo: status)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return OrderModel(
          orderDate: doc.get('orderDate'),
          address: doc.get('address'),
          status: doc.get('orderStatus'),
          totalPrice: doc.get('totalPrice').toString(),
          orderId: doc.get('orderId'),
          productId: doc.get('productId'),
          userId: doc.get('userId'),
          price: doc.get('price').toString(),
          ProductName: doc.get('product title').toString(),
          quantity: doc.get('quantity').toString(),
          imageUrl: doc.get('imageUrl'),
          userName: doc.get('username'),
        );
      }).toList();
    });
  }

  // Stream for Processing orders
  Stream<List<OrderModel>> getProcessingOrdersStream() {
    return getOrdersStreamByStatus('processing');
  }

  // Stream for Shipped orders
  Stream<List<OrderModel>> getShippedOrdersStream() {
    return getOrdersStreamByStatus('shipped');
  }

  // Stream for Delivered orders
  Stream<List<OrderModel>> getDeliveredOrdersStream() {
    return getOrdersStreamByStatus('delivered');
  }

  // Stream for Cancelled orders
  Stream<List<OrderModel>> getCancelledOrdersStream() {
    return getOrdersStreamByStatus('cancelled');
  }
  Stream<List<OrderModel>> getpendingOrdersStream() {
    return getOrdersStreamByStatus('pending');
  }
  // Stream for all orders

  // Update the status of an order
  Future<void> updateOrderStatus(
      String userId, String orderId, String newStatus) async {
    try {
      DocumentReference orderRef = _firestore
          .collection('orders')
          .doc(userId)
          .collection('userOrders')
          .doc(orderId);

      DocumentSnapshot docSnapshot = await orderRef.get();
      if (!docSnapshot.exists) {
        print(
            'Order document not found for userId: $userId, orderId: $orderId');
        return;
      }

      await orderRef.update({'orderStatus': newStatus});

      int index = _orders.indexWhere((order) => order.orderId == orderId);
      if (index != -1) {
        _orders[index].status = newStatus;
        notifyListeners();
      }
    } catch (e) {
      print(
          'Failed to update order status for userId: $userId, orderId: $orderId, error: $e');
      rethrow;
    }
  }
}
