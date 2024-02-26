import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/features/book/presentation/bloc/book_bloc.dart';
import 'package:whashlist/features/book/presentation/bloc/book_event.dart';
import 'package:whashlist/features/book/presentation/bloc/book_state.dart';
import 'package:whashlist/injection_container.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({Key? key}) : super(key: key);

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  late BookBloc bookBloc;
  late TextEditingController q;

  @override
  void initState() {
    super.initState();
    bookBloc = sl<BookBloc>(); // Assurez-vous que sl<BookBloc>() est votre méthode pour obtenir l'instance de votre bloc
    q = TextEditingController();
  }

  @override
  void dispose() {
    q.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    bookBloc.add(SearchBookEvent(q: q.text));
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: q,
                    decoration: InputDecoration(
                      hintText: 'Chercher un livre...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => q.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              bloc: bookBloc,
              builder: (context, state) {
                if (state is BookLoaded) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Nombre de colonnes
                      childAspectRatio: 0.8, // Ratio pour la taille des enfants
                      crossAxisSpacing: 5, // Espacement horizontal
                      mainAxisSpacing: 5, // Espacement vertical
                    ),
                    itemCount: state.searchbook?.length ?? 0,
                    itemBuilder: (context, index) {
                      final book = state.searchbook?[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                               child: InkWell(
                                onTap: () {
                                  context.go("/detailsbook", extra: book);
                                },
                                child: Image.network(
                                  book!.imageLink ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(book.title ?? 'Titre inconnu', textAlign: TextAlign.center),
                          ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is BookError) {
                  return const Center(child: Text('Erreur de chargement'));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}