import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';

class ConnectedBody extends StatelessWidget {
  const ConnectedBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    if (authProvider.isLoggedIn) {
      Future.delayed(const Duration(seconds: 7), () {
        context.go('/');
      });

      return Center(
        child: Text(
          'Bon retour ${userProvider.userPrenom}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    } else {
      return Container();
    }
  }
}
