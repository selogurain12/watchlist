import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_bloc.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_event.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_state.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddMovieToFilmEnCours extends StatefulWidget {
  final String? id_film;
  final int? totalTemps;

  const AddMovieToFilmEnCours({Key? key, this.id_film, this.totalTemps}) : super(key: key);

  @override
  State<AddMovieToFilmEnCours> createState() => _AddMovieToFilmEnCours();
}

class _AddMovieToFilmEnCours extends State<AddMovieToFilmEnCours> {
  late FilmEnCoursBloc filmEnCoursBloc;
  late TextEditingController nbtempsvus;
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    filmEnCoursBloc = sl<FilmEnCoursBloc>();
    nbtempsvus = TextEditingController();
  }

  @override
  void dispose() {
    nbtempsvus.dispose();
    filmEnCoursBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<FilmEnCoursBloc, FilmEnCoursState>(
      bloc: filmEnCoursBloc,
      builder: (context, state) {
        if (state is CreateFilmEnCoursError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Le film n'a pas pu être ajouté"),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.of(context).pop();
          });
        }
        if (state is CreateFilmEnCoursLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Le film a été ajouté"),
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
                  'Ajouter un film en cours',
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
                    controller: nbtempsvus,
                    onChanged: (value) {
                      setState(() {
                        int pagesLues = int.tryParse(value) ?? 0;
                        progressValue = widget.totalTemps != null && widget.totalTemps! > 0
                          ? pagesLues / widget.totalTemps!
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
                Text("${(progressValue * 100).toStringAsFixed(2)}% de temps vus"),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    String inputTemps = nbtempsvus.text.trim();
                    if (inputTemps.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Veuillez entrer un nombre de minutes vus"),
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
                    int? tempsVus;
                    try {
                      tempsVus = int.parse(inputTemps);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Le nombre de minutes doit être un nombre valide"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    filmEnCoursBloc.add(CreateFilmEnCoursEvent(
                        id_film: widget.id_film,
                        tempsvisionnage: tempsVus,
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
