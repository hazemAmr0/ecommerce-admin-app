import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
              height:300,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFF6f32f9), Color(0xFFa441f8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const   Text(
                        'Hello hazem !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       color: Colors.brown.shade800,
                       borderRadius: BorderRadius.circular(15.0),
                     ),
                     child: Image.asset('assets/profile1.png'),
                   )
                  
                    ],
                  ),
                  const SizedBox(height: 80),
                const  Text(
                    'total Sales',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
               const   Text(
                    '\$1260.40',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                ],
              ),
            );
  }
}