import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/book/presentation/widgets/bookdetails.dart';

class DetailsbookScreen extends StatelessWidget {
  final ApiBookResponseEntity book;
  const DetailsbookScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          GestureDetector(
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
          ),
        ],
      ),
      body: DetailBook(book: book)
    );
  }
}