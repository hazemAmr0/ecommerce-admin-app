import 'package:admin_app/models/order_model.dart';
import 'package:admin_app/providers/admin%20_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/order_card.dart';

class DeliveredOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: StreamBuilder<List<OrderModel>>(
        stream: Provider.of<OrderProvider>(context).getDeliveredOrdersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Delivered Orders Found'));
          }
          final orders = snapshot.data!;
        
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OrderCard(order: orders[index]),
              );
            },
          );
        },
      ),
    );
  }
}
