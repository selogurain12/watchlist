// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';

class CompteBody extends StatelessWidget {
  const CompteBody({Key? key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            '${userProvider.userUsername}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 50),
          ClipRRect(
            child: ElevatedButton(
              onPressed: () {
                context.go("/stats");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFCE5CB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(50.0),
                child: const Text(
                  'Voir les statistiques',
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Mes amis',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
