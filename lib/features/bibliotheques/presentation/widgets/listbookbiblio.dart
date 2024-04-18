import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/features/bibliotheques/presentation/widgets/deletebookbibliotheque.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/deletemoviefilmotheque.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class ListBookBiblio extends StatefulWidget {
  final String? bibliothequeId;

  const ListBookBiblio({Key? key, required this.bibliothequeId})
      : super(key: key);

  @override
  State<ListBookBiblio> createState() => _ListBookBiblio();
}

class _ListBookBiblio extends State<ListBookBiblio> {
  late BibliothequesBloc bibliothequesBloc;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
    bibliothequesBloc.add(ListLivreBibliothequeEvent(
      id_bibliotheque: widget.bibliothequeId,
    ));
  }

  @override
  void dispose() {
    bibliothequesBloc.close();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<BibliothequesBloc, BibliothequesState>(
    bloc: bibliothequesBloc,
    builder: (context, state) {
      print(state);
      if (state is ListLivreBibliothequeLoaded) {
        final listbibliotheque = state.bibliothequebook;
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
                      context.go("/bibliotheque");
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
                itemCount: listbibliotheque?.length ?? 0,
                itemBuilder: (context, index) {
                  final bibliotheque = listbibliotheque![index];
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
                                context.go("/detailsbook", extra: bibliotheque);
                              },
                              child: Center(
                                child: Image.network(
                                  "${bibliotheque.imageLink}",
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
                                  bibliotheque.title ?? 'Titre inconnu',
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
                                        return DeleteBookBibliotheque(
                                            bibliothequeId: widget.bibliothequeId,
                                            bookId: bibliotheque.id,
                                            onBookBibliothequeDelete: () {
                                              bibliothequesBloc.add(BibliothequesEvent(id: userProvider.userId));
                                              bibliothequesBloc.add(ListLivreBibliothequeEvent(id_bibliotheque: widget.bibliothequeId));
                                            });
                                      },
                                    );
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text("Supprimer le livre de la bibliotheque"),
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
