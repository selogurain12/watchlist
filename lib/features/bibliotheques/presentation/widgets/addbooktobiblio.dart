// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/createbibliotheque.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddBook extends StatefulWidget {
  final ApiBookResponseEntity book;

  const AddBook({Key? key, required this.book}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  late BibliothequesBloc bibliothequesBloc;
  late StatsBloc statsBloc;
  late TextEditingController nom;
  String? selectedValue;
  int? pageslu;
  bool showCreateForm = false;
  String? selectedBookId;
  String? selectedBibliothequeId;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
    statsBloc = sl<StatsBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    nom = TextEditingController();
    selectedBookId = widget.book.id;
    pageslu = widget.book.pageCount;
    bibliothequesBloc.add(BibliothequesEvent(id: userProvider.userId));
  }

  @override
  void dispose() {
    super.dispose();
    nom.dispose();
    bibliothequesBloc.close();
    statsBloc.close(); 
  }

  @override
Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<BibliothequesBloc, BibliothequesState>(
    bloc: bibliothequesBloc,
    builder: (context, state) {
      if (state is LivreBibliothequeError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Le livre a déjà été ajouté à cette bibliothèque"),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.of(context).pop();
        });
      }
      if (state.bibliotheques != null) {
        List<DropdownMenuItem<String>> dropdownItems = state.bibliotheques!
            .map<DropdownMenuItem<String>>((item) => DropdownMenuItem<String>(
                  value: item.nom,
                  child: Text(item.nom ?? ""),
                ))
            .toList();

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
                  'Choisir une bibliothèque',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                if (!showCreateForm)
                  DropdownButton<String>(
                    items: dropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                        selectedBibliothequeId = state.bibliotheques!
                            .firstWhere((element) => element.nom == newValue)
                            .id; // Récupération de l'ID de la filmothèque sélectionnée
                      });
                    },
                    value: selectedValue,
                    hint: const Text('Sélectionnez un élément'),
                  ),
                const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (BuildContext context) {
                          return AddBibliotheque(
                            onBibliothequeAdded: () {
            // Cette fonction sera appelée lorsque la bibliothèque est ajoutée avec succès
            bibliothequesBloc.add(BibliothequesEvent(id: userProvider.userId));
          },
                          );
                        }
                        );
                    },
                    child: const Text("Créer une bibliothèque"),
                  ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    bibliothequesBloc.add(
                      LivreBibliothequeEvent(
                        id_bibliotheque: selectedBibliothequeId,
                        id_livre: selectedBookId,
                      ),
                    );
                     if (selectedBibliothequeId == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Pas de bibliothèque sélectionné"),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.of(context).pop();
        });
      }
                    if (state is BibliothequesLoaded) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        if(state is! LivreBibliothequeError && state is! BibliothequesError && selectedBibliothequeId != null){
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.of(context).pop(true);
                        }
                      });
                    }
                  },
                  child: const Text('Valider'),
                ),
              ],
            ),
          ),
        );
      }
      return Container();
    },
  );
}
}
