import 'package:admin_app/constants/colors/App_color.dart';
import 'package:admin_app/core/routing/App_router.dart';
import 'package:admin_app/core/routing/routes.dart';
import 'package:admin_app/providers/admin%20_order_provider.dart';
import 'package:admin_app/providers/product_provider.dart';
import 'package:admin_app/screens/dashboard/dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ProductProvider()),
              ChangeNotifierProvider(create: (context) => OrderProvider()),
            ],
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              child: MaterialApp(
                theme: ThemeData(
                  scaffoldBackgroundColor: AppColor.ScaffoldColor,
                  //   brightness: Brightness.dark,
                ),
                debugShowCheckedModeBanner: false,
                title: 'Admin App',
                home: DashboardScreen(),
                onGenerateRoute: appRouter.generateRoute,
                initialRoute: Routes.dashboard,
              ),
            ),
          );
        });
  }
}
