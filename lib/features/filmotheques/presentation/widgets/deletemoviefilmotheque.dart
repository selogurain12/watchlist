// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteMovieFilmotheque extends StatefulWidget {
  final VoidCallback onMovieFilmothequeDelete;
  final int? movieId;
  final String? filmothequeId;

  const DeleteMovieFilmotheque(
      {Key? key,
      required this.filmothequeId,
      required this.movieId,
      required this.onMovieFilmothequeDelete})
      : super(key: key);

  @override
  State<DeleteMovieFilmotheque> createState() => _DeleteMovieFilmotheque();
}

class _DeleteMovieFilmotheque extends State<DeleteMovieFilmotheque> {
  late FilmothequesBloc filmothequesBloc;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    filmothequesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmothequesBloc, FilmothequeState>(
        bloc: filmothequesBloc,
        builder: (context, state) {
          if (state is DeleteMovieLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onMovieFilmothequeDelete();
            Navigator.pop(context);
          }
          return AlertDialog(
            title: const Text('Confirmer la suppression'),
            content: const Text(
                'Êtes-vous sûr de vouloir supprimer ce film de la filmothèque?'),
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
                  final deleteRequest = DeleteFilmRequestEntity(
                    filmIds: widget.movieId != null ? [widget.movieId!.toString()] : null,
                  );
                  filmothequesBloc.add(DeleteMovieEvent(
                      id: widget.filmothequeId,
                      filmIds: deleteRequest));
                },
              ),
            ],
          );
        });
  }
}
