// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/addbooktobiblio.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/livreencours/presentation/widgets/addbooktolivreencours.dart';
import 'package:whashlist/features/livretermine/presentation/widgets/addbooktolivretermine.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DetailBook extends StatefulWidget {
  final ApiBookResponseEntity book;
  const DetailBook({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
late StatsBloc statsBloc;
int? pageslu;

 @override
  void initState() {
    super.initState();
    statsBloc = sl<StatsBloc>();
    pageslu = widget.book.pageCount;
  }

@override
void dispose() {
  super.dispose();
  statsBloc.close();
}

 @override
Widget build(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.go("/addbook");
                        },
                        child: const Icon(Icons.arrow_back_rounded),
                      ),
                    ],
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
        ),
        floatingActionButton: authProvider.isLoggedIn ? buildSpeedDial() : null,
      );
  }

SpeedDial buildSpeedDial() {
  return SpeedDial(
    icon: Icons.add,
    activeIcon: Icons.close,
    buttonSize: Size(56.0, 56.0),
    visible: true,
    curve: Curves.bounceIn,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    tooltip: 'Menu',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 8.0,
    shape: CircleBorder(),
    children: [
      SpeedDialChild(
        child: Icon(Icons.bookmark),
        backgroundColor: Colors.red,
        label: 'Ajouter à une bibliothèque',
        labelStyle: TextStyle(fontSize: 16.0),
        onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddBook(book: widget.book);
                              },
                            );
                            if (result != null && result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("La bibliothèque a été mise à jour"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
      ),
      SpeedDialChild(
        child: Icon(Icons.timelapse_outlined),
        backgroundColor: Colors.green,
        label: 'Je suis en train de lire ce livre',
        labelStyle: TextStyle(fontSize: 16.0),
        onTap: ()async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddBookToLivreEnCours(id_livre: widget.book.id, totalPages: widget.book.pageCount,);
                              },
                            );
                            if (result != null && result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("La bibliothèque a été mise à jour"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
      ),
      SpeedDialChild(
        child: Icon(Icons.done),
        backgroundColor: Colors.blue,
        label: 'J\'ai terminé ce livre',
        labelStyle: TextStyle(fontSize: 16.0),
        onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddBookToLivreTermine(id_livre: widget.book.id);
                              },
                            );
                            if (result != null && result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("La bibliothèque a été mise à jour"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
      ),
    ],
  );
}
}