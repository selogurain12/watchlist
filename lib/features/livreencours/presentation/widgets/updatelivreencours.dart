// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_bloc.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_event.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_state.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_bloc.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_event.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_state.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class UpdateLivreEnCours extends StatefulWidget {
  final VoidCallback onLivreEnCours;
  final AllLivreEnCoursResponseEntity livreEnCours;

  const UpdateLivreEnCours(
      {Key? key, required this.livreEnCours, required this.onLivreEnCours})
      : super(key: key);

  @override
  State<UpdateLivreEnCours> createState() => _UpdateLivreEnCours();
}

class _UpdateLivreEnCours extends State<UpdateLivreEnCours> {
  late LivreEnCoursBloc livreEnCoursBloc;
  late LivreTermineBloc livreTermineBloc;
  late TextEditingController nbpageslus;
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    livreEnCoursBloc = sl<LivreEnCoursBloc>();
    livreTermineBloc = sl<LivreTermineBloc>();
    nbpageslus = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nbpageslus.dispose();
    livreTermineBloc.close();
    livreEnCoursBloc.close();
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
        BlocListener<LivreEnCoursBloc, LivreEnCoursState>(
            bloc: livreEnCoursBloc,
            listener: (context, state) {
              if (state is UpdateLivreEnCoursError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("Le livre en cours n'a pas pu être modifié"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  Navigator.of(context).pop();
                });
              }
              if (state is UpdateLivreEnCoursLoaded) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  widget.onLivreEnCours();
                  Navigator.pop(context);
                });
              }
            }),
        BlocListener<LivreTermineBloc, LivreTermineState>(
          bloc: livreTermineBloc,
          listener: (context, state) {
            if (state is CreateLivreTermineLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                widget.onLivreEnCours();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Ce livre a été ajouté à la liste des livres terminés"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              });
            }
          },
        ),
      ],
      child: BlocBuilder<LivreEnCoursBloc, LivreEnCoursState>(
        bloc: livreEnCoursBloc,
        builder: (context, state) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Modifier le nombre de pages lus',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre de pages lues',
                      ),
                      controller: nbpageslus,
                      onChanged: (value) {
                        setState(() {
                          int pagesLues = int.tryParse(value) ?? 0;
                          progressValue =
                              widget.livreEnCours.pageCount != null &&
                                      widget.livreEnCours.pageCount! > 0
                                  ? pagesLues / widget.livreEnCours.pageCount!
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
                      "${(progressValue * 100).toStringAsFixed(2)}% de pages lues"),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (nbpageslus.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Veuillez entrer un nombre de pages lues"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        final nbPagesLus = int.tryParse(nbpageslus.text);
                        if (nbPagesLus == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Veuillez entrer un nombre valide"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (nbPagesLus >
                            widget.livreEnCours.pageCount!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Le nombre de pages lues ne peut pas être supérieur au nombre total de pages"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (nbPagesLus ==
                            widget.livreEnCours.pageCount) {
                          livreEnCoursBloc.add(DeleteLivreEnCoursEvent(
                              id: widget.livreEnCours.id));
                          livreTermineBloc.add(CreateLivreTermineEvent(
                            id_livre: widget.livreEnCours.id,
                            user: usersList,
                          ));
                        } else {
                          final updateRequest = UpdateLivreEnCoursRequestEntity(
                              nbpageslus: nbPagesLus);
                          livreEnCoursBloc.add(UpdateLivreEnCoursEvent(
                            update: updateRequest,
                            id: widget.livreEnCours.id,
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
