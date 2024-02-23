import 'package:flutter/material.dart';
import 'package:whashlist/features/user/presentation/widgets/home_body.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCE5CB),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            '../images/home.png',
            width: 30.0,
          ),
        ),
        title: const Center(
          child: Text('HOME'),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.go('/login');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                '../images/2815428.png',
                width: 80.0,
              ),
            ),
          ),
        ],
      ),
      body: const HomeBody()
   );
  }
}