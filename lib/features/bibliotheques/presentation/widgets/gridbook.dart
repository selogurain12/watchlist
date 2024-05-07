import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/injection_container.dart';

class GridBook extends StatefulWidget {
  final String? bibliothequeId;

  const GridBook({Key? key, required this.bibliothequeId}) : super(key: key);

  @override
  State<GridBook> createState() => _GridBook();
}

class _GridBook extends State<GridBook> {
  late BibliothequesBloc bibliothequesBloc;

  @override
  void initState() {
    super.initState();
    bibliothequesBloc = sl<BibliothequesBloc>();
    bibliothequesBloc.add(ListLivreEvent(
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
    return BlocBuilder<BibliothequesBloc, BibliothequeState>(
      bloc: bibliothequesBloc,
      builder: (context, state) {
        if (state is ListLivreLoaded) {
          final listbibliotheques = state.listbook;
          return GridView.builder(
              padding: EdgeInsets.zero, // Retirer tout padding
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Nombre de colonnes
                crossAxisSpacing: 0, // Espace entre les colonnes
                mainAxisSpacing: 0, // Espace entre les lignes
              ),
              itemCount: (listbibliotheques?.length ?? 0) > 4 ? 4 : (listbibliotheques?.length ?? 0),
              itemBuilder: (context, index) {
                final bibliotheque = listbibliotheques![index];
                return Image.network(
                  "${bibliotheque.imageLink}", // Supposant que imageUrl contient l'URL de l'image
                  fit: BoxFit
                      .cover, // Couvrir l'espace disponible sans déformer l'image
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
