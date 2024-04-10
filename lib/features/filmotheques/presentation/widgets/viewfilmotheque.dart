// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/addmovietofilmo.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/createfilmotheque.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/deletefilmotheque.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/renamefilmotheque.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

import 'gridmovie.dart';

class ViewFilmotheque extends StatefulWidget {
  const ViewFilmotheque({Key? key}) : super(key: key);

  @override
  State<ViewFilmotheque> createState() => _ViewFilmothequeState();
}

class _ViewFilmothequeState extends State<ViewFilmotheque> {
  late FilmothequesBloc filmothequesBloc;
  late TextEditingController nom;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    filmothequesBloc.add(FilmothequesEvent(
      id: userProvider.userId,
    ));
    nom = TextEditingController();
  }

  @override
  void dispose() {
    filmothequesBloc.close();
    super.dispose();
    nom.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<FilmothequesBloc, FilmothequesState>(
      bloc: filmothequesBloc,
      builder: (context, state) {
        if (!authProvider.isLoggedIn) {
      return Scaffold(
        body: Center(
          child: Text("Veuillez vous connecter"),
        ),
      );
    } if (state is FilmothequesLoaded) {
          return Scaffold(
              body: Column(children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          8.0), // Ajoutez du padding autour du bouton de retour
                  child: ElevatedButton(
                    onPressed: () {
                      context.go("/");
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const Spacer(), // Utilisé pour pousser le bouton suivant vers la droite
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal:
                            8.0), // Ajoutez du padding autour du bouton de création
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddFilmotheque(
                              onFilmothequeAdded: () {
                                filmothequesBloc.add(
                                    FilmothequesEvent(id: userProvider.userId));
                              },
                            );
                          },
                        );
                        if (result != null && result) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("La filmothèque a été créée"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: const Text("Créer une filmothèque"),
                    ),
                  ),
              ],
            ),
            Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(3),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.77 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.filmotheques?.length,
                    itemBuilder: (context, index) {
                      final filmotheque = state.filmotheques?[index];
                      return InkWell(
                        onTap: () {
                          print(filmotheque.id);
                          context.go(
                            "/listefilms",
                            extra: filmotheque,
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                child:
                                    GridMovie(filmothequeId: filmotheque?.id),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.black.withOpacity(0.5),
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                filmotheque!.nom!,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            PopupMenuButton<String>(
                                              icon: const Icon(Icons.more_vert,
                                                  color: Colors.white),
                                              onSelected: (value) {
                                                switch (value) {
                                                  case 'delete':
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return DeleteFilmotheque(
                                                            filmotheque:
                                                                filmotheque,
                                                            onFilmothequeDelete:
                                                                () {
                                                              filmothequesBloc.add(
                                                                  FilmothequesEvent(
                                                                      id: userProvider
                                                                          .userId));
                                                            });
                                                      },
                                                    );
                                                    break;
                                                  case 'rename':
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return RenameFilmotheque(
                                                              filmotheque:
                                                                  filmotheque,
                                                              onFilmothequeRename:
                                                                  () {
                                                                filmothequesBloc.add(
                                                                    FilmothequesEvent(
                                                                        id: userProvider
                                                                            .userId));
                                                              });
                                                        });
                                                    break;
                                                }
                                              },
                                              itemBuilder: (context) => [
                                                const PopupMenuItem(
                                                  value: 'share',
                                                  child: Text(
                                                      "Partager la filmothèque"),
                                                ),
                                                const PopupMenuItem(
                                                  value: 'rename',
                                                  child: Text(
                                                      "Renommer la filmothèque"),
                                                ),
                                                const PopupMenuItem(
                                                  value: 'delete',
                                                  child: Text(
                                                      "Supprimer la filmothèque"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ]));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
