// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_bloc.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_event.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteLivreEnCours extends StatefulWidget {
  final VoidCallback onBookLivreEnCoursDelete;
  final String? livreId;

  const DeleteLivreEnCours(
      {Key? key, required this.livreId, required this.onBookLivreEnCoursDelete})
      : super(key: key);

  @override
  State<DeleteLivreEnCours> createState() => _DeleteMovieLivreEnCours();
}

class _DeleteMovieLivreEnCours extends State<DeleteLivreEnCours> {
  late LivreEnCoursBloc livreencoursBloc;

  @override
  void initState() {
    super.initState();
    livreencoursBloc = sl<LivreEnCoursBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    livreencoursBloc.close();
  }

  @override
  Widget build(BuildContext context) {
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
                  livreencoursBloc.add(
                      DeleteLivreEnCoursEvent(id: widget.livreId));
                },
              ),
            ],
          );
        });
  }
}
