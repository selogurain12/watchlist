import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.book.imageLink!
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop,
              ),
            )
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: (){

                  }, 
                  child: const Text("Ajouter à une bibliothèque")
                  ),
                  const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.book.imageLink != null)
                        Image.network(
                          "${widget.book.imageLink}",
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.book),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      'Titre: ${widget.book.title}',
                                      style: Theme.of(context).textTheme.titleLarge,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 10,
                                    )
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      'Auteur(s): ${widget.book.authors?.join(",")}',
                                      style: Theme.of(context).textTheme.titleMedium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 10,
                                    )
                                  )
                                ],
                              ),
                            ]
                          )
                        )
                    ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text(
                                'Description: ${widget.book.description ?? 'Pas de description disponible.'}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Edition: ${widget.book.publisher ?? "Pas d'édition disponible."}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Date de publication: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(widget.book.publisherDate!))}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Code ISBN: ${widget.book.industryIdentifieridentyfier ?? 'Pas de code ISBN disponible.'}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Nombre de pages: ${widget.book.pageCount ?? 'Pas de nombre de pages disponible.'}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Categories: ${widget.book.categories?.join(",")}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Prix: ${widget.book.retailPriceamount} ${widget.book.retailPricecurrencyCode}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Lien vers le livre: ${widget.book.retailPricebuyLink ?? 'Pas de lien vers le livre disponible.'}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ]
                          )
                        )
                      ],
                    ),
                  ],
                )
              ),
            )
          ]
        )
      );
  }
}