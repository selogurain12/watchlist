import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_bloc.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_event.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_state.dart';
import 'package:whashlist/features/filmtermine/presentation/widgets/deletemoviefilmtermine.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class ListFilmTermine extends StatefulWidget {

  const ListFilmTermine({Key? key})
      : super(key: key);

  @override
  State<ListFilmTermine> createState() => _ListFilmTermine();
}

class _ListFilmTermine extends State<ListFilmTermine> {
  late FilmTermineBloc filmTermineBloc;

  @override
  void initState() {
    super.initState();
    filmTermineBloc = sl<FilmTermineBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    filmTermineBloc.add(ListFilmTermineEvent(
      id: userProvider.userId,
    ));
  }

  @override
  void dispose() {
    filmTermineBloc.close();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context);
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<FilmTermineBloc, FilmTermineState>(
    bloc: filmTermineBloc,
    builder: (context, state) {
       if (!authProvider.isLoggedIn) {
      return const Scaffold(
        body: Center(
          child: Text("Veuillez vous connecter"),
        ),
      );
    }
      if (state is ListFilmTermineLoaded) {
        final listfilmtermine = state.listfilmtermine;
        return Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          8.0), // Ajoutez du padding autour du bouton de retour
                  child: ElevatedButton(
                    onPressed: () {
                      context.go("/film");
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero, // Retirer tout padding
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Nombre de colonnes
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 2, // Espace entre les colonnes
                  mainAxisSpacing: 2, // Espace entre les lignes
                ),
                itemCount: listfilmtermine?.length ?? 0,
                itemBuilder: (context, index) {
                  final filmtermine = listfilmtermine![index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch, // Étendre les éléments horizontalement
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.go("/detailsmovie", extra: filmtermine);
                              },
                              child: Center(
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${filmtermine.poster_path}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacer le titre et le menu
                            children: [
                              Expanded(
                                child: Text(
                                  filmtermine.title ?? 'Titre inconnu',
                                  overflow: TextOverflow.ellipsis, // Gérer les titres trop longs
                                ),
                              ),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert, color: Colors.black), // Assurez-vous que la couleur est visible
                                onSelected: (value) {
                                  if (value == 'delete') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DeleteMovieFilmTermine(
                                            movieId: filmtermine.id,
                                            onMovieFilmTermineDelete: () {
                                              filmTermineBloc.add(ListFilmTermineEvent(
                                                id: userProvider.userId,
                                              ));
                                            });
                                      },
                                    );
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text("Supprimer le film de la filmothèque"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
}
