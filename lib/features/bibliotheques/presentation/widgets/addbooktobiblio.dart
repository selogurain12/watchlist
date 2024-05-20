// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/createbibliotheque.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
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
  List<String>? selectedBookId;
  String? selectedBibliothequeId;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
    statsBloc = sl<StatsBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    nom = TextEditingController();
    selectedBookId = widget.book.id != null ? [widget.book.id!] : [];
    pageslu = widget.book.pageCount;
    bibliothequesBloc.add(ListBibliothequeEvent(
        id: userProvider.userId,
        nom: userProvider.userNom,
        prenom: userProvider.userPrenom,
        username: userProvider.userUsername,
        mail: userProvider.userMail));
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
    return BlocBuilder<BibliothequesBloc, BibliothequeState>(
      bloc: bibliothequesBloc,
      builder: (context, state) {
        if (state is ModifieBibliothequeError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text("Le livre a déjà été ajouté à cette bibliothèque"),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.of(context).pop();
          });
        }
        if (state.listbibliotheque != null) {
          List<DropdownMenuItem<String>> dropdownItems = state.listbibliotheque!
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
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  if (!showCreateForm)
                    DropdownButton<String>(
                      items: dropdownItems,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                          selectedBibliothequeId = state.listbibliotheque!
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
                                bibliothequesBloc.add(ListBibliothequeEvent(
                                    id: userProvider.userId,
                                    nom: userProvider.userNom,
                                    prenom: userProvider.userPrenom,
                                    username: userProvider.userUsername,
                                    mail: userProvider.userMail));
                              },
                            );
                          });
                    },
                    child: const Text("Créer une bibliothèque"),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      bibliothequesBloc.add(
                        ModifieBibliothequeEvent(
                          id_bibliotheque: selectedBibliothequeId,
                          id_livres: selectedBookId,
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
                      if (state is ListBibliothequeLoaded) {
                        final updateStats =
              StatsRequestEntity(tempsvu: 0, pageslu: widget.book.pageCount);
          statsBloc.add(
            UpdateStatEvent(
              id: userProvider.userId,
              update: updateStats,
            ),
          );
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          if (state is! ModifieBibliothequeLoaded &&
                              state is! BibliothequesError &&
                              selectedBibliothequeId != null) {
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
