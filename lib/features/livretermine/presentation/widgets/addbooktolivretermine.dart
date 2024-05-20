// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_bloc.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_event.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddBookToLivreTermine extends StatefulWidget {
  final String? id_livre;
  final int? pageslus;

  const AddBookToLivreTermine(
      {Key? key, required this.id_livre, required this.pageslus})
      : super(key: key);

  @override
  State<AddBookToLivreTermine> createState() => _AddBookToLivreTermine();
}

class _AddBookToLivreTermine extends State<AddBookToLivreTermine> {
  late LivreTermineBloc livretermineBloc;
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    livretermineBloc = sl<LivreTermineBloc>();
    statsBloc = sl<StatsBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    statsBloc.close();
    livretermineBloc.close();
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
    return BlocBuilder<LivreTermineBloc, LivreTermineState>(
        bloc: livretermineBloc,
        builder: (context, state) {
          if (state is CreateLivreTermineError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Le livre n'a pas pu être ajouté"),
                  backgroundColor: Colors.red,
                ),
              );
              Navigator.of(context).pop();
            });
          }
          if (state is CreateLivreTermineLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Le livre a été ajouté"),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            });
          }
          return AlertDialog(
            title: const Text('Confirmer l\'ajout'),
            content: Text(
                'Êtes-vous sûr de vouloir ajouter ce livre aux livres terminés?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ajouter'),
                onPressed: () {
                  final updateStats =
                      StatsRequestEntity(tempsvu: 0, pageslu: widget.pageslus);
                  statsBloc.add(
                    UpdateStatEvent(
                      id: userProvider.userId,
                      update: updateStats,
                    ),
                  );
                  livretermineBloc.add(CreateLivreTermineEvent(
                      id_livre: widget.id_livre, user: usersList));
                },
              ),
            ],
          );
        });
  }
}
