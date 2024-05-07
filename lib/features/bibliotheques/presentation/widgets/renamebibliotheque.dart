// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class RenameBibliotheque extends StatefulWidget {
  final VoidCallback onBibliothequeRename;
  final BibliothequeResponseEntity bibliotheque;

  const RenameBibliotheque({Key? key, required this.bibliotheque, required this.onBibliothequeRename})
      : super(key: key);

  @override
  State<RenameBibliotheque> createState() => _RenameBibliotheque();
}

class _RenameBibliotheque extends State<RenameBibliotheque> {
  late BibliothequesBloc bibliothequesBloc;
  late TextEditingController nom;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
    nom = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nom.dispose();
    bibliothequesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final initialName = widget.bibliotheque.nom;
    nom = TextEditingController(text: widget.bibliotheque.nom);
    return BlocBuilder<BibliothequesBloc, BibliothequeState>(
        bloc: bibliothequesBloc,
        builder: (context, state) {
          if (state is ModifieBibliothequeError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("La bibliotheque n'a pas pu être renommée"),
                  backgroundColor: Colors.red,
                ),
              );
              Navigator.of(context).pop();
            });
          }
          Future.delayed(const Duration(seconds: 5));
          if (state is ModifieBibliothequeLoaded) {
            Future.delayed(const Duration(seconds: 2));
            widget.onBibliothequeRename();
            Navigator.pop(context);
          }
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Renommer la bibliothèque',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nom de la bibliothèque',
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
                                "Veuillez entrer un nom pour la bibliothèque"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      if (initialName == nom.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Vous n'avez pas modifier le nom de la bibliothèque"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        bibliothequesBloc.add(ModifieBibliothequeEvent(
                            id_bibliotheque: widget.bibliotheque.id,
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
