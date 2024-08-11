import 'package:admin_app/constants/colors/App_color.dart';
import 'package:admin_app/screens/dashboard/widgets/custom_appbar.dart';
import 'package:admin_app/screens/dashboard/widgets/dashboard_body.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColor.ScaffoldColor,
      body: const SafeArea(
        child: Column(
          children: [
           CustomAppBar(),
            SizedBox(height: 20),
           DashboardBody(),
           
          ],
        ),
      ),
    );
  }
}
