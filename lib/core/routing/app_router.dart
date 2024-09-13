import 'package:admin_app/screens/dashboard/dashboard_screen.dart';
import 'package:admin_app/screens/edit_product/edit_upload_product.dart';
import 'package:admin_app/screens/orders/admin_order_view.dart';
import 'package:admin_app/screens/search/push_nonifcations/push_notifications_screen.dart';
import 'package:admin_app/screens/search/search_scree.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.search:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case Routes.editProduct:
        return MaterialPageRoute(builder: (_) => const EditOrUploadProductScreen());
        case Routes.orders:
        return MaterialPageRoute(builder: (_) => AdminOrdersScreen());
        case Routes.orders:
        return MaterialPageRoute(builder: (_) => AdminOrdersScreen());
case Routes.pushNotifications:
        return MaterialPageRoute(builder: (_) =>  PushNotificationScreen());

      // Add other cases as needed
      default:
        // This is a fallback route in case an undefined route is navigated to.
        return MaterialPageRoute(
            builder: (_) =>
                DashboardScreen()); // Assuming NotFoundPage is a defined widget for unknown routes
    }
  }
}
