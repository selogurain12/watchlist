// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_bloc.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_event.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteLivreTermine extends StatefulWidget {
  final VoidCallback onBookLivreTermineDelete;
  final String? livreId;
  final int? pagesLus;

  const DeleteLivreTermine(
      {Key? key, required this.livreId, required this.onBookLivreTermineDelete, required this.pagesLus})
      : super(key: key);

  @override
  State<DeleteLivreTermine> createState() => _DeleteMovieLivreTermine();
}

class _DeleteMovieLivreTermine extends State<DeleteLivreTermine> {
  late LivreTermineBloc livreTermineBloc;
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    livreTermineBloc = sl<LivreTermineBloc>();
    statsBloc = sl<StatsBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    statsBloc.close();
    livreTermineBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<LivreTermineBloc, LivreTermineState>(
        bloc: livreTermineBloc,
        builder: (context, state) {
          if (state is DeleteLivreTermineLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onBookLivreTermineDelete();
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
              statsBloc.add(UpdateStatEvent(id: userProvider.userId,
              update: updateStats,));
                  livreTermineBloc.add(
                      DeleteLivreTermineEvent(id: widget.livreId));
                },
              ),
            ],
          );
        });
  }
}
