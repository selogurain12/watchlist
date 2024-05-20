// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_bloc.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_event.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteFilmEnCours extends StatefulWidget {
  final VoidCallback onBookFilmEnCoursDelete;
  final String? filmId;
  final int? tempsVu;

  const DeleteFilmEnCours(
      {Key? key, required this.filmId, required this.tempsVu, required this.onBookFilmEnCoursDelete})
      : super(key: key);

  @override
  State<DeleteFilmEnCours> createState() => _DeleteMovieFilmEnCours();
}

class _DeleteMovieFilmEnCours extends State<DeleteFilmEnCours> {
  late FilmEnCoursBloc filmencoursBloc;
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    statsBloc = sl<StatsBloc>();
    filmencoursBloc = sl<FilmEnCoursBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    filmencoursBloc.close();
    statsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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
                  final updateStats =
                      StatsRequestEntity(tempsvu: -widget.tempsVu!, pageslu: 0);
                  statsBloc.add(UpdateStatEvent(
                    id: userProvider.userId,
                    update: updateStats,
                  ));
                  filmencoursBloc
                      .add(DeleteFilmEnCoursEvent(id: widget.filmId));
                },
              ),
            ],
          );
        });
  }
}
