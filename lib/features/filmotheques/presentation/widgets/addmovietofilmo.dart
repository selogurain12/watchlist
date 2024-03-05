import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddMovie extends StatefulWidget {
  final SearchMovieResponseEntity movie;

  const AddMovie({Key? key, required this.movie}) : super(key: key);

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  late FilmothequesBloc filmothequesBloc;
  late TextEditingController nom;
  String? selectedValue;
  bool showCreateForm = false;
  String? selectedMovieId;
  String? selectedFilmothequeId;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    nom = TextEditingController();
    selectedMovieId = widget.movie.id.toString();
    filmothequesBloc.add(FilmothequesEvent(id: userProvider.userId));
  }

  @override
  void dispose() {
    super.dispose();
    nom.dispose();
    filmothequesBloc.close();
  }

  @override
Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return BlocBuilder<FilmothequesBloc, FilmothequesState>(
    bloc: filmothequesBloc,
    builder: (context, state) {
      if (state is FilmFilmothequeError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Le film a déjà été ajouté à cette filmothèque"),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.of(context).pop();
        });
      } else if (state is FilmothequesError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("La filmothèque existe déjà"),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.of(context).pop();
        });
      }
      if (state.filmotheques != null) {
        List<DropdownMenuItem<String>> dropdownItems = state.filmotheques!
            .map<DropdownMenuItem<String>>((item) => DropdownMenuItem<String>(
                  value: item.nom,
                  child: Text(item.nom ?? ""),
                ))
            .toList();

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
                  'Choisir une filmothèque',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                if (!showCreateForm)
                  DropdownButton<String>(
                    items: dropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                        selectedFilmothequeId = state.filmotheques!
                            .firstWhere((element) => element.nom == newValue)
                            .id; // Récupération de l'ID de la filmothèque sélectionnée
                      });
                    },
                    value: selectedValue,
                    hint: const Text('Sélectionnez un élément'),
                  ),
                const SizedBox(height: 16.0),
                if (!showCreateForm)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showCreateForm = true;
                      });
                    },
                    child: const Text("Créer une filmothèque"),
                  ),
                if (showCreateForm)
                  const Text("Créer une filmothèque"),
                const SizedBox(height: 16.0),
                if (showCreateForm)
                  SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nom de la filmothèque',
                      ),
                      controller: nom,
                    ),
                  ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (showCreateForm) {
                      filmothequesBloc.add(
                        AddFilmothequeEvent(
                          nom: nom.text,
                          id_user: userProvider.userId,
                        ),
                      );
                    }
                    filmothequesBloc.add(
                      FilmFilmothequeEvent(
                        id_filmotheque: selectedFilmothequeId ?? "",
                        id_film: selectedMovieId ?? "",
                      ),
                    );
                    if (state is FilmothequesLoaded) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        if (state is! FilmFilmothequeError && state is! FilmothequesError) {
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.of(context).pop(true);
                        }
                      });
                    }
                  },
                  child: const Text('Valider'),
                ),
              ],
            ),
          ),
        );
      }
      return Container();
    },
  );
}
}
