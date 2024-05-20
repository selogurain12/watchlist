import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_bloc.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_event.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddBookToLivreEnCours extends StatefulWidget {
  final String? id_livre;
  final int? totalPages;

  const AddBookToLivreEnCours({Key? key, this.id_livre, this.totalPages}) : super(key: key);

  @override
  State<AddBookToLivreEnCours> createState() => _AddBookToLivreEnCours();
}

class _AddBookToLivreEnCours extends State<AddBookToLivreEnCours> {
  late LivreEnCoursBloc livreEnCoursBloc;
  late TextEditingController nbpageslus;
  double progressValue = 0.0;
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    livreEnCoursBloc = sl<LivreEnCoursBloc>();
    nbpageslus = TextEditingController();
    statsBloc = sl<StatsBloc>();
  }

  @override
  void dispose() {
    nbpageslus.dispose();
    livreEnCoursBloc.close();
    statsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<LivreEnCoursBloc, LivreEnCoursState>(
      bloc: livreEnCoursBloc,
      builder: (context, state) {
        if (state is CreateLivreEnCoursError) {
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
        if (state is CreateLivreEnCoursLoaded) {
          final updateStats =
              StatsRequestEntity(tempsvu: 0, pageslu: widget.totalPages);
          statsBloc.add(
            UpdateStatEvent(
              id: userProvider.userId,
              update: updateStats,
            ),
          );
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
                  'Ajouter un livre en cours',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                        progressValue = widget.totalPages != null && widget.totalPages! > 0
                          ? pagesLues / widget.totalPages!
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
                Text("${(progressValue * 100).toStringAsFixed(2)}% de pages lues"),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    String inputPages = nbpageslus.text.trim();
                    if (inputPages.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Veuillez entrer un nombre de pages lues"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    final user = UserRequestModel(
                        id: userProvider.userId,
                        nom: userProvider.userNom,
                        prenom: userProvider.userPrenom,
                        mail: userProvider.userMail,
                        username: userProvider.userUsername);
                    int? pagesLus;
                    try {
                      pagesLus = int.parse(inputPages);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Le nombre de pages doit être un nombre valide"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    final updateStats =
              StatsRequestEntity(tempsvu: 0, pageslu: pagesLus);
          statsBloc.add(
            UpdateStatEvent(
              id: userProvider.userId,
              update: updateStats,
            ),
          );
                    livreEnCoursBloc.add(CreateLivreEnCoursEvent(
                        id_livre: widget.id_livre,
                        nbpageslus: pagesLus,
                        user: user));
                  },
                  child: const Text('Valider'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
