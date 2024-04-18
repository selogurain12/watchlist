// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteBibliotheque extends StatefulWidget {
  final VoidCallback onBibliothequeDelete;
  final BibliothequesResponseEntity bibliotheque;

  const DeleteBibliotheque({Key? key, required this.bibliotheque, required this.onBibliothequeDelete})
      : super(key: key);

  @override
  State<DeleteBibliotheque> createState() => _DeleteBibliotheque();
}

class _DeleteBibliotheque extends State<DeleteBibliotheque> {
  late BibliothequesBloc bibliothequesBloc;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    bibliothequesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BibliothequesBloc, BibliothequesState>(
        bloc: bibliothequesBloc,
        builder: (context, state) {
          if (state is DeleteBibliothequeLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onBibliothequeDelete();
            Navigator.pop(context);
          }
          return AlertDialog(
            title: const Text(
              'Confirmer la suppression'),
            content: Text(
              'Êtes-vous sûr de vouloir supprimer la bibliothèque ${widget.bibliotheque.nom}?'),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Supprimer'),
                  onPressed:() {
                    bibliothequesBloc.add(
                      DeleteBibliothequeEvent(
                        id_bibliotheque: widget.bibliotheque.id));
                    },
                  ),
              ],
          );
        });
  }
}
