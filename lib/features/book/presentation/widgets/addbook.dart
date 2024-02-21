import 'package:flutter/material.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

class LinesPage extends StatelessWidget {
  final ApiBookResponseEntity booksResponse;

  const LinesPage({Key? key, required this.booksResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accès à la liste des livres à l'intérieur de booksResponse
    // Cette ligne est un exemple; vous devez l'adapter selon la structure réelle de ApiBookResponseEntity
    final books = booksResponse; // Adapté selon votre structure

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lignes sur la page'),
      ),
      body: ListView.builder(
        itemCount: books.id?.length,
        itemBuilder: (context, index) {
          final book = books;
          // Supposons que 'authors' est une liste, nous la joignons pour créer une chaîne
          final authorsString = book.authors?.join(', '); // Adaptez selon votre structure réelle

          return ListTile(
            title: Text(book.title ?? 'Titre inconnu'), // Gestion d'un titre potentiellement null
            subtitle: Text(authorsString!),
          );
        },
      ),
    );
  }
}
