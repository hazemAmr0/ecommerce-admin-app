import 'package:admin_app/core/routing/routes.dart';
import 'package:admin_app/screens/dashboard/widgets/dashboard_button.dart';
import 'package:admin_app/screens/edit_product/edit_upload_product.dart';
import 'package:admin_app/screens/search/search_scree.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    children: [
                      DashboardButton(
                        icon: Icons.production_quantity_limits,
                        text: 'add product',
                        onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditOrUploadProductScreen()),
                  );

                        
                        },
                        
                      ),
                      DashboardButton(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()),);
                        },
                        icon: Icons.inventory,
                        text: 'Products',
                      ),
                      DashboardButton(
                        onTap: () {
                                                  Navigator.pushNamed(context, Routes.orders);

                        },
                        icon: Icons.trending_up,
                        text: 'View ordes',
                      ),
                      DashboardButton(
                        onTap: () {
        Navigator.pushNamed(context, Routes.pushNotifications);

                        },
                        icon: Icons.notification_add,
                        text: 'push notification',
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}