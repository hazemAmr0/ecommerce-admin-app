import 'package:admin_app/constants/Category_List.dart';
import 'package:admin_app/models/order_model.dart';
import 'package:admin_app/providers/admin%20_order_provider.dart';
import 'package:admin_app/screens/orders/admin_order_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatefulWidget {
  OrderCard({super.key, required this.order,});
  final OrderModel order;
 
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;
  String? _selectedStatus;
  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd MMM yyyy').format(widget.order.orderDate.toDate());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.green,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.receipt, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Text(
                    'Order ID: ${widget.order.orderId.characters.take(8).toString().toUpperCase()}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_month, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Text('Order Date: ${formattedDate}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Text('Status: ${widget.order.status}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.attach_money, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Text('Total Amount: \$${widget.order.totalPrice}'),
              ],
            ),
            if (isExpanded) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.green, size: 20),
                  const SizedBox(width: 8),
                  Text('Address: ${widget.order.address}'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.green, size: 20),
                  const SizedBox(width: 8),
                  Text('Quantity: ${widget.order.quantity}'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.local_mall, color: Colors.green, size: 20),
                  const SizedBox(width: 8),
                  Text('product: ${widget.order.ProductName}'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.attach_money, color: Colors.green, size: 20),
                  const SizedBox(width: 8),
                  Text('price: ${widget.order.price}'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.person, color: Colors.green, size: 20),
                  const SizedBox(width: 8),
                  Text('username: ${widget.order.userName}'),
                ],
              ),
               Row(
      children: [
     DropdownButton<String>(
                    hint: const Text(
                      "Select Status",
                      style: TextStyle(
                        color: Colors.grey, // Change the hint text color
                        fontSize: 16, // Change the hint text size
                      ),
                    ),
                    value: _selectedStatus,
                    items: AppConst.statueDropDownList,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedStatus = newValue;
                      });
                      if (newValue != null) {
                        // Update the order status via Provider
                        Provider.of<OrderProvider>(context, listen: false)
                            .updateOrderStatus(widget.order.userId,
                                widget.order.orderId, newValue);
                      }
                    },
                    style: const TextStyle(
                      color:
                          Colors.black, // Change the selected item text color
                      fontSize: 18, // Change the selected item text size
                    ),
                    dropdownColor:
                        Colors.white, // Change the dropdown background color
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue, // Change the dropdown icon color
                    ),
                  ),
      ],
    ),
             
            ],
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 30.h,
                child: TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(5.0),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: toggleExpanded,
                  child: Text(isExpanded ? 'Show Less' : 'Show More',
                      style: const TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
