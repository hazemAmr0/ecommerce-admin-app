import 'package:admin_app/constants/colors/App_color.dart';
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  DashboardButton({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColor.ButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CircleAvatar(
            
              backgroundColor: Colors.blue,
              radius: 25,
              child: Icon(
                icon,
                color: AppColor.ButtonColor,
                size: 20,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              text,
              style:const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
