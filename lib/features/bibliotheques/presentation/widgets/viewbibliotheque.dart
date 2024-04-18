// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/createbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/deletebibliotheque.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/gridbook.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/renamebibliotheque.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class ViewBibliotheque extends StatefulWidget {
  const ViewBibliotheque({Key? key}) : super(key: key);

  @override
  State<ViewBibliotheque> createState() => _ViewBibliotheque();
}

class _ViewBibliotheque extends State<ViewBibliotheque> {
  late BibliothequesBloc bibliothequesBloc;
  late TextEditingController nom;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    bibliothequesBloc.add(BibliothequesEvent(
      id: userProvider.userId,
    ));
    nom = TextEditingController();
  }

  @override
  void dispose() {
    bibliothequesBloc.close();
    super.dispose();
    nom.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<BibliothequesBloc, BibliothequesState>(
      bloc: bibliothequesBloc,
      builder: (context, state) {
        if (!authProvider.isLoggedIn) {
      return const Scaffold(
        body: Center(
          child: Text("Veuillez vous connecter"),
        ),
      );
    } if (state is BibliothequesLoaded) {
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
                            return AddBibliotheque(
                              onBibliothequeAdded: () {
                                bibliothequesBloc.add(
                                    BibliothequesEvent(id: userProvider.userId));
                              },
                            );
                          },
                        );
                        if (result != null && result) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("La bibliothèque a été créée"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: const Text("Créer une bibliothèque"),
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
                    itemCount: state.bibliotheques?.length,
                    itemBuilder: (context, index) {
                      final bibliotheque = state.bibliotheques?[index];
                      return InkWell(
                        onTap: () {
                          context.go(
                            "/listebooks",
                            extra: bibliotheque,
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                child:
                                    GridBook(bibliothequeId: bibliotheque?.id),
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
                                                bibliotheque!.nom!,
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
                                                        return DeleteBibliotheque(
                                                            bibliotheque:
                                                                bibliotheque,
                                                            onBibliothequeDelete:
                                                                () {
                                                              bibliothequesBloc.add(
                                                                  BibliothequesEvent(
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
                                                          return RenameBibliotheque(
                                                              bibliotheque:
                                                                  bibliotheque,
                                                              onBibliothequeRename:
                                                                  () {
                                                                bibliothequesBloc.add(
                                                                    BibliothequesEvent(
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
                                                      "Partager la bibliothèque"),
                                                ),
                                                const PopupMenuItem(
                                                  value: 'rename',
                                                  child: Text(
                                                      "Renommer la bibliothèque"),
                                                ),
                                                const PopupMenuItem(
                                                  value: 'delete',
                                                  child: Text(
                                                      "Supprimer la bibliothèque"),
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
