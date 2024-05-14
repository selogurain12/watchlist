// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_bloc.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_event.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteMovieFilmTermine extends StatefulWidget {
  final VoidCallback onMovieFilmTermineDelete;
  final int? movieId;

  const DeleteMovieFilmTermine(
      {Key? key, required this.movieId, required this.onMovieFilmTermineDelete})
      : super(key: key);

  @override
  State<DeleteMovieFilmTermine> createState() => _DeleteMovieFilmTermine();
}

class _DeleteMovieFilmTermine extends State<DeleteMovieFilmTermine> {
  late FilmTermineBloc filmTermineBloc;

  @override
  void initState() {
    super.initState();
    filmTermineBloc = sl<FilmTermineBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    filmTermineBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmTermineBloc, FilmTermineState>(
        bloc: filmTermineBloc,
        builder: (context, state) {
          if (state is DeleteFilmTermineLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onMovieFilmTermineDelete();
            Navigator.pop(context);
          }
          return AlertDialog(
            title: const Text('Confirmer la suppression'),
            content: const Text(
                'Êtes-vous sûr de vouloir supprimer ce film des films terminés?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Supprimer'),
                onPressed: () {
                  filmTermineBloc.add(
                      DeleteFilmTermineEvent(id: widget.movieId.toString()));
                },
              ),
            ],
          );
        });
  }
}
