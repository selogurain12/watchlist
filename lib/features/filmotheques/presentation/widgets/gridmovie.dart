import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class GridMovie extends StatefulWidget {
  final String? filmothequeId;

  const GridMovie({Key? key, required this.filmothequeId}) : super(key: key);

  @override
  State<GridMovie> createState() => _GridMovieState();
}

class _GridMovieState extends State<GridMovie> {
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
                crossAxisSpacing: 0, // Espace entre les colonnes
                mainAxisSpacing: 0, // Espace entre les lignes
              ),
              itemCount: listfilmotheques?.length ?? 0,
              itemBuilder: (context, index) {
                final filmotheque = listfilmotheques![index];
                return Image.network(
                  "https://image.tmdb.org/t/p/original/${filmotheque.poster_path}", // Supposant que imageUrl contient l'URL de l'image
                  fit: BoxFit
                      .cover, // Couvrir l'espace disponible sans déformer l'image
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
