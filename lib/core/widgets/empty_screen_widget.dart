import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routing/routes.dart';

class EmptyScreenIdget extends StatelessWidget {
  const EmptyScreenIdget({
    super.key,
    required this.img,
    required this.title1,
    required this.title2,
    required this.title3,
  });
  final String img;
  final String title1;
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          img,
          height: 200,
        ),
        SizedBox(
          height: 70,
        ),
        Text(
          title1,
          style: TextStyle(fontSize: 35),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title2,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
        Text(
          title3,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        SizedBox(
          height: 150,
        ),
    
      ],
    );
  }
}
