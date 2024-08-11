import 'package:admin_app/constants/colors/App_color.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCart extends StatelessWidget {
  const ShimmerCart({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(builder: (context, index) {
      return  SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
        width: 200, // Adjust the width as needed or use .w if you are using a responsive package
        decoration: BoxDecoration(
          color: Colors.white, // Placeholder color
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                 color: Colors.grey[200], // Placeholder color
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
highlightColor: Colors.white,
  baseColor: Colors.grey[200]!,
                      child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: double.infinity,
                                height: 16, // Adjust the height as needed
                                // Placeholder color
                              ),
                    ),
                    SizedBox(height: 5), // Adjust the size as needed or use .h if you are using a responsive package
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 16, // Adjust the height as needed
                     // Placeholder color
                    ),
                    SizedBox(height: 5), // Adjust the size as needed or use .h if you are using a responsive package
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ) 
                        ),
                         Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ) 
                        ),
                         Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ) 
                        ),
                         Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ) 
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
            ),
          ),
      );
    },
     itemCount: 6, crossAxisCount: 2);
  }
}