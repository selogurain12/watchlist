import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_bloc.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_event.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_state.dart';
import 'package:whashlist/features/livretermine/presentation/widgets/deletemovielivretermine.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class ListLivreTermine extends StatefulWidget {

  const ListLivreTermine({Key? key})
      : super(key: key);

  @override
  State<ListLivreTermine> createState() => _ListLivreTermine();
}

class _ListLivreTermine extends State<ListLivreTermine> {
  late LivreTermineBloc livreTermineBloc;

  @override
  void initState() {
    super.initState();
    livreTermineBloc = sl<LivreTermineBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    livreTermineBloc.add(ListLivreTermineEvent(
      id: userProvider.userId,
    ));
  }

  @override
  void dispose() {
    livreTermineBloc.close();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context);
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<LivreTermineBloc, LivreTermineState>(
    bloc: livreTermineBloc,
    builder: (context, state) {
       if (!authProvider.isLoggedIn) {
      return const Scaffold(
        body: Center(
          child: Text("Veuillez vous connecter"),
        ),
      );
    }
      if (state is ListLivreTermineLoaded) {
        final listlivretermine = state.listlivretermine;
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
                itemCount: listlivretermine?.length ?? 0,
                itemBuilder: (context, index) {
                  final livretermine = listlivretermine![index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch, // Étendre les éléments horizontalement
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.go("/detailsbook", extra: livretermine);
                              },
                              child: Center(
                                child: Image.network(
                                  "${livretermine.imageLink}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacer le titre et le menu
                            children: [
                              Expanded(
                                child: Text(
                                  livretermine.title ?? 'Titre inconnu',
                                  overflow: TextOverflow.ellipsis, // Gérer les titres trop longs
                                ),
                              ),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert, color: Colors.black), // Assurez-vous que la couleur est visible
                                onSelected: (value) {
                                  if (value == 'delete') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DeleteLivreTermine(
                                            livreId: livretermine.id,
                                            pagesLus: livretermine.pageCount,
                                            onBookLivreTermineDelete: () {
                                              livreTermineBloc.add(ListLivreTermineEvent(
                                                id: userProvider.userId,
                                              ));
                                            });
                                      },
                                    );
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text("Supprimer le livre de la bibliothèque"),
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
              ),
            ),
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
