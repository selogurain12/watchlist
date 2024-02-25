import 'package:flutter/material.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart'; // Assurez-vous que le chemin est correct

class DetailBook extends StatefulWidget {
  final ApiBookResponseEntity book;
  const DetailBook({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.book.title ?? 'Détails du livre'),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.book.imageLink != null)
            Image.network(
              widget.book.imageLink!,
              width: 200,
              fit: BoxFit.cover,
            ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Titre: ${widget.book.title}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Auteur(s): ${widget.book.authors?.join(', ') ?? 'Inconnu'}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Description: ${widget.book.description ?? 'Pas de description disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Edition: ${widget.book.publisher ?? "Pas d'édition disponible."}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Date de publication: ${widget.book.publisherDate ?? 'Pas de date de publication disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Code ISBN: ${widget.book.industryIdentifieridentyfier ?? 'Pas de code ISBN disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Nombre de pages: ${widget.book.pageCount ?? 'Pas de nombre de pages disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Categories: ${widget.book.categories ?? 'Pas de categories disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Prix: ${widget.book.retailPriceamount} ${widget.book.retailPricecurrencyCode}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Lien vers le livre: ${widget.book.retailPricebuyLink ?? 'Pas de lien vers le livre disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}