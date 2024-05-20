// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_bloc.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_event.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteFilmEnCours extends StatefulWidget {
  final VoidCallback onBookFilmEnCoursDelete;
  final String? filmId;

  const DeleteFilmEnCours(
      {Key? key, required this.filmId, required this.onBookFilmEnCoursDelete})
      : super(key: key);

  @override
  State<DeleteFilmEnCours> createState() => _DeleteMovieFilmEnCours();
}

class _DeleteMovieFilmEnCours extends State<DeleteFilmEnCours> {
  late FilmEnCoursBloc filmencoursBloc;

  @override
  void initState() {
    super.initState();
    filmencoursBloc = sl<FilmEnCoursBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    filmencoursBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmEnCoursBloc, FilmEnCoursState>(
        bloc: filmencoursBloc,
        builder: (context, state) {
          if (state is DeleteFilmEnCoursLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onBookFilmEnCoursDelete();
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
                  filmencoursBloc.add(
                      DeleteFilmEnCoursEvent(id: widget.filmId));
                },
              ),
            ],
          );
        });
  }
}
