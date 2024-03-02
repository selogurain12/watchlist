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
  String? selectedValue; // Add this variable to store the selected value

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    filmothequesBloc.add(FilmothequesEvent(id: userProvider.userId));
  }

  @override
  void dispose() {
    super.dispose();
    filmothequesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmothequesBloc, FilmothequesState>(
      bloc: filmothequesBloc,
      builder: (context, state) {
        if (state is FilmothequesLoaded) {
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
                  DropdownButton<String>(
                    items: dropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    value: selectedValue,
                    hint: const Text('Sélectionnez un élément'),
                  ),

                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fermer'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
