import 'package:admin_app/screens/dashboard/dashboard_screen.dart';
import 'package:admin_app/screens/edit_product/edit_upload_product.dart';
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
        return MaterialPageRoute(builder: (_) => EditOrUploadProductScreen());

      // Add other cases as needed
      default:
        // This is a fallback route in case an undefined route is navigated to.
        return MaterialPageRoute(
            builder: (_) =>
                DashboardScreen()); // Assuming NotFoundPage is a defined widget for unknown routes
    }
  }
}
