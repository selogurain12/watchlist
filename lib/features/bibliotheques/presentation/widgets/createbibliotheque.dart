// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddBibliotheque extends StatefulWidget {
  final VoidCallback onBibliothequeAdded;

  const AddBibliotheque({Key? key, required this.onBibliothequeAdded}) : super(key: key);

  @override
  State<AddBibliotheque> createState() => _AddBibliothequeState();
}


class _AddBibliothequeState extends State<AddBibliotheque> {
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
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<BibliothequesBloc, BibliothequesState>(
    bloc: bibliothequesBloc,
    builder: (context, state) {
      if (state is BibliothequesError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("La bibliothèque existe déjà"),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.of(context).pop();
        });
      }
       Future.delayed(const Duration(seconds: 5));
    if (state is AddBibliothequeLoaded) {
        Future.delayed(const Duration(seconds: 2));
        widget.onBibliothequeAdded();
        Navigator.pop(context); // Fermer la modale et revenir à la modale précédente
      }
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Créer une bibliothèque',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
  onPressed: () async {
    if (nom.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez entrer un nom pour la bibliothèque"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      bibliothequesBloc.add(
        AddBibliothequeEvent(
          nom: nom.text,
          id_user: userProvider.userId,
        ),
      );
    }
  },
  child: const Text('Valider'),
),

              ],
            ),
          ),
        );
      }
  );
}
}
