import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        title: const Text('Rechercher un livre'),
      ),
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
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookLoaded) {
                    return ListView.builder(
                      itemCount: state.searchbook?.length ?? 0,
                      itemBuilder: (context, index) {
                        final book = state.searchbook?[index];
                        return ListTile(
                          leading: Image.network(book?.imageLink ?? '', fit: BoxFit.cover, width: 50, height: 50,), // Assurez-vous que 'imageLink' est l'URL de l'image du livre
                          title: Text(book?.title ?? 'Titre inconnu'),
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
