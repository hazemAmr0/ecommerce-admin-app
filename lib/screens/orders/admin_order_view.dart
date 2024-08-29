import 'package:admin_app/screens/orders/widgets/Cancelled_Screen.dart';
import 'package:admin_app/screens/orders/widgets/Delivered_Screen.dart';
import 'package:admin_app/screens/orders/widgets/pending_screen.dart';
import 'package:admin_app/screens/orders/widgets/processing_screen.dart';
import 'package:admin_app/screens/orders/widgets/shipping_screen.dart';
import 'package:flutter/material.dart';

class AdminOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('All Orders'),
          bottom: const TabBar(
            isScrollable: true,
            indicatorWeight: 3.0,
            indicatorColor: Colors.green,
            dividerColor: Colors.transparent,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorPadding: EdgeInsets.all(5.0),
            labelStyle: TextStyle(fontSize: 15.0),
          
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Processing'),
              Tab(text: 'Shipped'),
              Tab(text: 'Delivered'),
              Tab(text: 'Canceled'),

              // Add other tabs as needed
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            PendingOrdersScreen(),
            ProcessingOrdersScreen(),
            ShippedOrdersScreen(),
            DeliveredOrdersScreen(),
            CancelledOrdersScreen(),
            
            // Add other screens as needed
          ],
        ),
      ),
    );
  }
}
