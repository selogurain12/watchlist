import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/book/presentation/widgets/searchbook.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';

class SearchbookScreen extends StatelessWidget {
  const SearchbookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
        title: const Center(
          child: Text('BOOKS'),
        ),
        actions: [
          authProvider.isLoggedIn
              ? GestureDetector(
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
              : GestureDetector(
                  onTap: () {
                    context.go('/login');
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
      body: const SearchBook()
    );
  }
}