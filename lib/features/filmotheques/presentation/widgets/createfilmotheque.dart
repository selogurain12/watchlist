// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddFilmotheque extends StatefulWidget {
  final VoidCallback onFilmothequeAdded;

  const AddFilmotheque({Key? key, required this.onFilmothequeAdded}) : super(key: key);

  @override
  State<AddFilmotheque> createState() => _AddFilmothequeState();
}


class _AddFilmothequeState extends State<AddFilmotheque> {
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
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<FilmothequesBloc, FilmothequesState>(
    bloc: filmothequesBloc,
    builder: (context, state) {
      if (state is FilmothequesError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("La filmothèque existe déjà"),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.of(context).pop();
        });
      }
       Future.delayed(const Duration(seconds: 5));
    if (state is AddFilmothequeLoaded) {
        Future.delayed(const Duration(seconds: 2));
        widget.onFilmothequeAdded();
        Navigator.pop(context);
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
                  'Créer une filmothèque',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
  onPressed: () async {
    if (nom.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez entrer un nom pour la filmothèque"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      filmothequesBloc.add(
        AddFilmothequeEvent(
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
