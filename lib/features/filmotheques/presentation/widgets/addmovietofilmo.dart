// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/createfilmotheque.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddMovie extends StatefulWidget {
  final SearchMovieResponseEntity movie;

  const AddMovie({Key? key, required this.movie}) : super(key: key);

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  late FilmothequesBloc filmothequesBloc;
  late TextEditingController nom;
  String? selectedValue;
  bool showCreateForm = false;
  List<String>? selectedMovieId;
  String? selectedFilmothequeId;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    nom = TextEditingController();
    selectedMovieId =
        widget.movie.id.toString() != null ? [widget.movie.id!.toString()] : [];
    filmothequesBloc.add(ListFilmothequeEvent(
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
    filmothequesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<FilmothequesBloc, FilmothequeState>(
      bloc: filmothequesBloc,
      builder: (context, state) {
        if (state is ModifieFilmothequeError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Le film a déjà été ajouté à cette filmothèque"),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.of(context).pop();
          });
        }
        if (state.listfilmotheque != null) {
          List<DropdownMenuItem<String>> dropdownItems = state.listfilmotheque!
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
                    'Choisir une filmothèque',
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
                          selectedFilmothequeId = state.listfilmotheque!
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
                            return AddFilmotheque(
                              onFilmothequeAdded: () {
                                filmothequesBloc.add(ListFilmothequeEvent(
                                    id: userProvider.userId,
                                    nom: userProvider.userNom,
                                    prenom: userProvider.userPrenom,
                                    username: userProvider.userUsername,
                                    mail: userProvider.userMail));
                              },
                            );
                          });
                    },
                    child: const Text("Créer une filmothèque"),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      filmothequesBloc.add(
                        ModifieFilmothequeEvent(
                          id_filmotheque: selectedFilmothequeId ?? "",
                          id_films: selectedMovieId,
                        ),
                      );
                      if (selectedFilmothequeId == null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Pas de filmothèque sélectionné"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          Navigator.of(context).pop();
                        });
                      }
                      if (state is ListFilmothequeLoaded) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          if (state is! ModifieFilmothequeError &&
                              state is! FilmothequeError) {
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
