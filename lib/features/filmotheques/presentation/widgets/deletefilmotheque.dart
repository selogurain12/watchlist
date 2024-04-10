// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteFilmotheque extends StatefulWidget {
  final VoidCallback onFilmothequeDelete;
  final FilmothequesResponseEntity filmotheque;

  const DeleteFilmotheque({Key? key, required this.filmotheque, required this.onFilmothequeDelete})
      : super(key: key);

  @override
  State<DeleteFilmotheque> createState() => _DeleteFilmotheque();
}

class _DeleteFilmotheque extends State<DeleteFilmotheque> {
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
    return BlocBuilder<FilmothequesBloc, FilmothequesState>(
        bloc: filmothequesBloc,
        builder: (context, state) {
          if (state is DeleteFilmothequeLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onFilmothequeDelete();
            Navigator.pop(context);
          }
          return AlertDialog(
            title: const Text(
              'Confirmer la suppression'),
            content: Text(
              'Êtes-vous sûr de vouloir la filmothèque ${widget.filmotheque.nom}?'),
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
                    filmothequesBloc.add(
                      DeleteFilmothequeEvent(
                        id_filmotheque: widget.filmotheque.id));
                    },
                  ),
              ],
          );
        });
  }
}
