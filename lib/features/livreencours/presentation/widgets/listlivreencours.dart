import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_bloc.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_event.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_state.dart';
import 'package:whashlist/features/livreencours/presentation/widgets/deletelivreencours.dart';
import 'package:whashlist/features/livreencours/presentation/widgets/updatelivreencours.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class ListLivreEnCours extends StatefulWidget {
  const ListLivreEnCours({Key? key}) : super(key: key);

  @override
  State<ListLivreEnCours> createState() => _ListLivreEnCours();
}

class _ListLivreEnCours extends State<ListLivreEnCours> {
  late LivreEnCoursBloc livreencoursBloc;

  @override
  void initState() {
    super.initState();
    livreencoursBloc = sl<LivreEnCoursBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    livreencoursBloc.add(ListLivreEnCoursEvent(
      id: userProvider.userId,
    ));
  }

  @override
  void dispose() {
    livreencoursBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<LivreEnCoursBloc, LivreEnCoursState>(
      bloc: livreencoursBloc,
      builder: (context, state) {
        if (!authProvider.isLoggedIn) {
          return const Scaffold(
            body: Center(
              child: Text("Veuillez vous connecter"),
            ),
          );
        }
        if (state is ListLivreEnCoursLoaded) {
          final listlivreencours = state.listlivreencours;
          return Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal:
                            8.0), // Ajoutez du padding autour du bouton de retour
                    child: ElevatedButton(
                      onPressed: () {
                        context.go("/livre");
                      },
                      child: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: GridView.builder(
                padding: EdgeInsets.zero, // Retirer tout padding
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Nombre de colonnes
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 2, // Espace entre les colonnes
                  mainAxisSpacing: 2, // Espace entre les lignes
                ),
                itemCount: listlivreencours?.length,
                itemBuilder: (context, index) {
                  final livreencours = listlivreencours![index];
                  final progress =
                      (livreencours.nbpageslus!.toDouble()) /
                          (livreencours.pageCount ?? 1).toDouble();
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .stretch, // Étendre les éléments horizontalement
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.go("/detailsbook", extra: livreencours);
                              },
                              child: Center(
                                child: Image.network(
                                  "${livreencours.imageLink}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            livreencours.title ?? 'Titre inconnu',
                            overflow: TextOverflow
                                .ellipsis, // Gérer les titres trop longs
                          ),
                          const SizedBox(height: 4),
                          // Ajout de la barre de progression
                          LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey[300],
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Espacer le titre et le menu
                            children: [
                              Expanded(
                                child: Text(
                                  "${(progress * 100).toStringAsFixed(0)}% lu",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert,
                                    color: Colors.black),
                                onSelected: (value) {
                                  if (value == 'delete') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DeleteLivreEnCours(
                                            livreId: livreencours.id,
                                            pagesLus: livreencours.nbpageslus,
                                            onBookLivreEnCoursDelete: () {
                                              livreencoursBloc
                                                  .add(ListLivreEnCoursEvent(
                                                id: userProvider.userId,
                                              ));
                                            });
                                      },
                                    );
                                  }
                                  if (value == 'update') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return UpdateLivreEnCours(
                                            livreEnCours: livreencours,
                                            onLivreEnCours: () {
                                              livreencoursBloc
                                                  .add(ListLivreEnCoursEvent(
                                                id: userProvider.userId,
                                              ));
                                            });
                                      },
                                    );
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'update',
                                    child: Text(
                                        "Modifier le nombre de pages lus"),
                                  ),
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text(
                                        "Supprimer le livre de la bibliothèque"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}