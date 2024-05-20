// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteBookBibliotheque extends StatefulWidget {
  final VoidCallback onBookBibliothequeDelete;
  final String? bookId;
  final int? pageCount;
  final String? bibliothequeId;

  const DeleteBookBibliotheque(
      {Key? key,
      required this.bibliothequeId,
      required this.bookId,
      required this.pageCount,
      required this.onBookBibliothequeDelete})
      : super(key: key);

  @override
  State<DeleteBookBibliotheque> createState() => _DeleteBookBibliotheque();
}

class _DeleteBookBibliotheque extends State<DeleteBookBibliotheque> {
  late BibliothequesBloc bibliothequesBloc;
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
    statsBloc = sl<StatsBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    statsBloc.close();
    bibliothequesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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
                  final updateStats =
              StatsRequestEntity(tempsvu: 0, pageslu: -widget.pageCount!);
                  final deleteRequest = DeleteLivreRequestEntity(
                    livreIds: widget.bookId != null ? [widget.bookId!] : null,
                  );
                  statsBloc.add(UpdateStatEvent(id: userProvider.userId,
              update: updateStats,));
                  bibliothequesBloc.add(DeleteBookEvent(
                      id: widget.bibliothequeId, livreIds: deleteRequest));
                },
              ),
            ],
          );
        });
  }
}
