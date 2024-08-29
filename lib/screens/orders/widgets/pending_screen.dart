import 'package:admin_app/models/order_model.dart';
import 'package:admin_app/providers/admin%20_order_provider.dart';
import 'package:admin_app/screens/orders/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PendingOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<OrderModel>>(
        stream: ordersProvider.getpendingOrdersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print ('Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr: ${snapshot.error}');
            return Center(child: Text('Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Pending Orders Found'));
          }

          final pendingOrders = snapshot.data!;
             

          return ListView.builder(
            itemCount: pendingOrders.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OrderCard(order: pendingOrders[index]),
              );
            },
          );
        },
      ),
    );
  }
}
