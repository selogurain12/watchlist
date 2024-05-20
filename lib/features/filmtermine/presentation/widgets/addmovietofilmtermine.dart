// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_bloc.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_event.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddMovieToFilmTermine extends StatefulWidget {
  final String? id_film;
  final int? tempsvisionnage;

  const AddMovieToFilmTermine({Key? key, required this.id_film, required this.tempsvisionnage})
      : super(key: key);

  @override
  State<AddMovieToFilmTermine> createState() => _AddMovieToFilmTermine();
}

class _AddMovieToFilmTermine extends State<AddMovieToFilmTermine> {
  late FilmTermineBloc filmtermineBloc;
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    filmtermineBloc = sl<FilmTermineBloc>();
    statsBloc = sl<StatsBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    statsBloc.close();
    filmtermineBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final usersList = UserRequestModel(
        id: userProvider.userId,
        nom: userProvider.userNom,
        prenom: userProvider.userPrenom,
        mail: userProvider.userMail,
        username: userProvider.userUsername);
    return BlocBuilder<FilmTermineBloc, FilmTermineState>(
        bloc: filmtermineBloc,
        builder: (context, state) {
          if (state is CreateFilmTermineError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Le film n'a pas pu être ajouté"),
                  backgroundColor: Colors.red,
                ),
              );
              Navigator.of(context).pop();
            });
          }
          if (state is CreateFilmTermineLoaded) {
            final updateStats =
              StatsRequestEntity(tempsvu: widget.tempsvisionnage, pageslu: 0);
          statsBloc.add(
            UpdateStatEvent(
              id: userProvider.userId,
              update: updateStats,
            ),
          );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Le film a été ajouté"),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            });
          }
          return AlertDialog(
            title: const Text('Confirmer l\'ajout'),
            content: Text(
                'Êtes-vous sûr de vouloir ajouter ce film aux films terminés?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ajouter'),
                onPressed: () {
                  filmtermineBloc.add(CreateFilmTermineEvent(
                      id_film: widget.id_film, user: usersList));
                },
              ),
            ],
          );
        });
  }
}
