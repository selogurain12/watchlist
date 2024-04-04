import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class ListMovieFilmo extends StatefulWidget {
  final String? filmothequeId;

  const ListMovieFilmo({Key? key, required this.filmothequeId}) : super(key: key);

  @override
  State<ListMovieFilmo> createState() => _ListMovieFilmo();
}

class _ListMovieFilmo extends State<ListMovieFilmo> {
  late FilmothequesBloc filmothequesBloc;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    filmothequesBloc.add(ListFilmFilmothequeEvent(
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
    return BlocBuilder<FilmothequesBloc, FilmothequesState>(
      bloc: filmothequesBloc,
      builder: (context, state) {
        if (state is ListFilmFilmothequeLoaded) {
          final listfilmotheques = state.filmothequemovie;
          return GridView.builder(
              padding: EdgeInsets.zero, // Retirer tout padding
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Nombre de colonnes
                childAspectRatio: 0.8,
                crossAxisSpacing: 5, // Espace entre les colonnes
                mainAxisSpacing: 5, // Espace entre les lignes
              ),
              itemCount: listfilmotheques?.length ?? 0,
              itemBuilder: (context, index) {
                final filmotheque = listfilmotheques![index];
                return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.go("/detailsmovie", extra: filmotheque);
                                  },
                                  child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${filmotheque!.poster_path}",
                                  fit: BoxFit.cover,
                                ),
                                )
                              ),
                              const SizedBox(height: 8),
                              Text(filmotheque.title ?? 'Titre inconnu',
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      );
                    },
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
 