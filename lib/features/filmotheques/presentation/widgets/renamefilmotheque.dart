// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class RenameFilmotheque extends StatefulWidget {
  final VoidCallback onFilmothequeRename;
  final FilmothequeResponseEntity filmotheque;

  const RenameFilmotheque({Key? key, required this.filmotheque, required this.onFilmothequeRename})
      : super(key: key);

  @override
  State<RenameFilmotheque> createState() => _RenameFilmotheque();
}

class _RenameFilmotheque extends State<RenameFilmotheque> {
  late FilmothequesBloc filmothequesBloc;
  late TextEditingController nom;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    nom = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nom.dispose();
    filmothequesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final initialName = widget.filmotheque.nom;
    nom = TextEditingController(text: widget.filmotheque.nom);
    return BlocBuilder<FilmothequesBloc, FilmothequeState>(
        bloc: filmothequesBloc,
        builder: (context, state) {
          if (state is ModifieFilmothequeError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("La filmothèque n'a pas pu être renommée"),
                  backgroundColor: Colors.red,
                ),
              );
              Navigator.of(context).pop();
            });
          }
          Future.delayed(const Duration(seconds: 5));
          if (state is ModifieFilmothequeLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onFilmothequeRename();
            Navigator.pop(context);
          }
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Renommer la filmothèque',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nom de la filmothèque',
                      ),
                      controller: nom,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (nom.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Veuillez entrer un nom pour la filmothèque"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      if (initialName == nom.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Vous n'avez pas modifier le nom de la filmothèque"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        filmothequesBloc.add(ModifieFilmothequeEvent(
                            id_filmotheque: widget.filmotheque.id,
                            nom: nom.text,
                          ));
                      }
                    },
                    child: const Text('Valider'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
