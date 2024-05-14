// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_bloc.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_event.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteLivreTermine extends StatefulWidget {
  final VoidCallback onBookLivreTermineDelete;
  final String? livreId;

  const DeleteLivreTermine(
      {Key? key, required this.livreId, required this.onBookLivreTermineDelete})
      : super(key: key);

  @override
  State<DeleteLivreTermine> createState() => _DeleteMovieLivreTermine();
}

class _DeleteMovieLivreTermine extends State<DeleteLivreTermine> {
  late LivreTermineBloc livreTermineBloc;

  @override
  void initState() {
    super.initState();
    livreTermineBloc = sl<LivreTermineBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    livreTermineBloc.close();
  }

  @override
  Widget build(BuildContext context) {
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
                  livreTermineBloc.add(
                      DeleteLivreTermineEvent(id: widget.livreId));
                },
              ),
            ],
          );
        });
  }
}
