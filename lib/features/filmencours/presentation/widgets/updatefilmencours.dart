// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_bloc.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_event.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_state.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_bloc.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_event.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_state.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class UpdateFilmEnCours extends StatefulWidget {
  final VoidCallback onFilmEnCours;
  final AllFilmEnCoursResponseEntity filmEnCours;

  const UpdateFilmEnCours(
      {Key? key, required this.filmEnCours, required this.onFilmEnCours})
      : super(key: key);

  @override
  State<UpdateFilmEnCours> createState() => _UpdateFilmEnCours();
}

class _UpdateFilmEnCours extends State<UpdateFilmEnCours> {
  late FilmEnCoursBloc filmEnCoursBloc;
  late FilmTermineBloc filmTermineBloc;
  late TextEditingController nbtempsvus;
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    filmEnCoursBloc = sl<FilmEnCoursBloc>();
    filmTermineBloc = sl<FilmTermineBloc>();
    nbtempsvus = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nbtempsvus.dispose();
    filmTermineBloc.close();
    filmEnCoursBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final usersList = UserRequestModel(
        id: userProvider.userId,
        nom: userProvider.userNom,
        prenom: userProvider.userPrenom,
        mail: userProvider.userMail,
        username: userProvider.userUsername);

    return MultiBlocListener(
      listeners: [
        BlocListener<FilmEnCoursBloc, FilmEnCoursState>(
            bloc: filmEnCoursBloc,
            listener: (context, state) {
              if (state is UpdateFilmEnCoursError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("Le film en cours n'a pas pu être modifié"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  Navigator.of(context).pop();
                });
              }
              if (state is UpdateFilmEnCoursLoaded) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  widget.onFilmEnCours();
                  Navigator.pop(context);
                });
              }
            }),
        BlocListener<FilmTermineBloc, FilmTermineState>(
          bloc: filmTermineBloc,
          listener: (context, state) {
            if (state is CreateFilmTermineLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                widget.onFilmEnCours();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Ce film a été ajouté à la liste des films terminés"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              });
            }
          },
        ),
      ],
      child: BlocBuilder<FilmEnCoursBloc, FilmEnCoursState>(
        bloc: filmEnCoursBloc,
        builder: (context, state) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Modifier le nombre de temps vus',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre de temps vus',
                      ),
                      controller: nbtempsvus,
                      onChanged: (value) {
                        setState(() {
                          int tempsVus = int.tryParse(value) ?? 0;
                          progressValue =
                              widget.filmEnCours.runtime != null &&
                                      widget.filmEnCours.runtime! > 0
                                  ? tempsVus / widget.filmEnCours.runtime!
                                  : 0.0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  Text(
                      "${(progressValue * 100).toStringAsFixed(2)}% de temps vus"),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (nbtempsvus.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Veuillez entrer un nombre de minutes vus"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        final nbTempsVus = int.tryParse(nbtempsvus.text);
                        if (nbTempsVus == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Veuillez entrer un nombre valide"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (nbTempsVus >
                            widget.filmEnCours.runtime!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Le nombre de temps vus ne peut pas être supérieur à la durée total du film"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (nbTempsVus ==
                            widget.filmEnCours.runtime) {
                          filmEnCoursBloc.add(DeleteFilmEnCoursEvent(
                              id: widget.filmEnCours.id.toString()));
                          filmTermineBloc.add(CreateFilmTermineEvent(
                            id_film: widget.filmEnCours.id.toString(),
                            user: usersList,
                          ));
                        } else {
                          final updateRequest = UpdateFilmEnCoursRequestEntity(
                              tempsvisionnage: nbTempsVus);
                          filmEnCoursBloc.add(UpdateFilmEnCoursEvent(
                            update: updateRequest,
                            id: widget.filmEnCours.id.toString(),
                          ));
                        }
                      }
                    },
                    child: const Text('Valider'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
