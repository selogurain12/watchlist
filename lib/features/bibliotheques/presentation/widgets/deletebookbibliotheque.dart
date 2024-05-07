// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteBookBibliotheque extends StatefulWidget {
  final VoidCallback onBookBibliothequeDelete;
  final String? bookId;
  final String? bibliothequeId;

  const DeleteBookBibliotheque(
      {Key? key,
      required this.bibliothequeId,
      required this.bookId,
      required this.onBookBibliothequeDelete})
      : super(key: key);

  @override
  State<DeleteBookBibliotheque> createState() => _DeleteBookBibliotheque();
}

class _DeleteBookBibliotheque extends State<DeleteBookBibliotheque> {
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
    return BlocBuilder<BibliothequesBloc, BibliothequeState>(
        bloc: bibliothequesBloc,
        builder: (context, state) {
          if (state is DeleteBookLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onBookBibliothequeDelete();
            Navigator.pop(context);
          }
          return AlertDialog(
            title: const Text('Confirmer la suppression'),
            content: const Text(
                'Êtes-vous sûr de vouloir supprimer ce livre de la bibliothèque?'),
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
                  final deleteRequest = DeleteLivreRequestEntity(
                    livreIds: widget.bookId != null ? [widget.bookId!] : null,
                  );
                  bibliothequesBloc.add(DeleteBookEvent(
                      id: widget.bibliothequeId,
                      livreIds: deleteRequest));
                },
              ),
            ],
          );
        });
  }
}
