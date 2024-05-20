import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/deletemoviefilmotheque.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class ListMovieFilmo extends StatefulWidget {
  final String? filmothequeId;

  const ListMovieFilmo({Key? key, required this.filmothequeId})
      : super(key: key);

  @override
  State<ListMovieFilmo> createState() => _ListMovieFilmo();
}

class _ListMovieFilmo extends State<ListMovieFilmo> {
  late FilmothequesBloc filmothequesBloc;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    filmothequesBloc.add(ListFilmEvent(
      id_filmotheque: widget.filmothequeId,
    ));
  }

  @override
  void dispose() {
    filmothequesBloc.close();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<FilmothequesBloc, FilmothequeState>(
    bloc: filmothequesBloc,
    builder: (context, state) {
      if (state is ListFilmLoaded) {
        final listfilmotheques = state.listmovie;
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
                      context.go("/filmotheque");
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
                itemCount: listfilmotheques?.length ?? 0,
                itemBuilder: (context, index) {
                  final filmotheque = listfilmotheques![index];
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
                                context.go("/detailsmovie", extra: filmotheque);
                              },
                              child: Center(
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${filmotheque.poster_path}",
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
                                  filmotheque.title ?? 'Titre inconnu',
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
                                        return DeleteMovieFilmotheque(
                                            filmothequeId: widget.filmothequeId,
                                            movieId: filmotheque.id,
                                            tempsVisionnage: filmotheque.runtime,
                                            onMovieFilmothequeDelete: () {
                                              filmothequesBloc.add(ListFilmothequeEvent(id: userProvider.userId));
                                              filmothequesBloc.add(ListFilmEvent(id_filmotheque: widget.filmothequeId));
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
