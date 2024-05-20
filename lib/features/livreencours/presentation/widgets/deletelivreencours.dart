// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_bloc.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_event.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteLivreEnCours extends StatefulWidget {
  final VoidCallback onBookLivreEnCoursDelete;
  final String? livreId;
  final int? pagesLus;

  const DeleteLivreEnCours(
      {Key? key, required this.livreId, required this.onBookLivreEnCoursDelete, required this.pagesLus})
      : super(key: key);

  @override
  State<DeleteLivreEnCours> createState() => _DeleteMovieLivreEnCours();
}

class _DeleteMovieLivreEnCours extends State<DeleteLivreEnCours> {
  late LivreEnCoursBloc livreencoursBloc;
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    statsBloc = sl<StatsBloc>();
    livreencoursBloc = sl<LivreEnCoursBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    statsBloc.close();
    livreencoursBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<LivreEnCoursBloc, LivreEnCoursState>(
        bloc: livreencoursBloc,
        builder: (context, state) {
          if (state is DeleteLivreEnCoursLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onBookLivreEnCoursDelete();
            Navigator.pop(context);
          }
          return AlertDialog(
            title: const Text('Confirmer la suppression'),
            content: const Text(
                'Êtes-vous sûr de vouloir supprimer ce livre des livres terminés?'),
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
                      StatsRequestEntity(tempsvu: 0, pageslu: -widget.pagesLus!);
                      statsBloc.add(UpdateStatEvent(
                    id: userProvider.userId,
                    update: updateStats,
                  ));
                  livreencoursBloc.add(
                      DeleteLivreEnCoursEvent(id: widget.livreId));
                },
              ),
            ],
          );
        });
  }
}
