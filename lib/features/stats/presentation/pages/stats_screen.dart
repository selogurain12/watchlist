// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/stats/presentation/widget/stats_user.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:go_router/go_router.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCE5CB),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
                onTap: () {
                  context.go('/');
                },
                child: Image.asset(
            'assets/home.png',
            width: 30.0,
          ),
        ),
        ),
        title: GestureDetector(
          child: const Center(
            child: Text('STATISTIQUES'),
          ),
        ),
        actions: [
          GestureDetector(
                  onTap: () {
                    context.go('/compte');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      'assets/2815428.png',
                      width: 80.0,
                    ),
                  ),
                )
        ],
      ),
      body: const StatsUser(),
    );
  }
}
