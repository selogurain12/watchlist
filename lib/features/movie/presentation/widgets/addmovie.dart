import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:whashlist/features/movie/presentation/bloc/movie_event.dart';
import 'package:whashlist/features/movie/presentation/bloc/movie_state.dart';
import 'package:whashlist/injection_container.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  late MovieBloc movieBloc;
  late TextEditingController query;
  final _formKey = GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    movieBloc = sl<MovieBloc>();
    query = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    movieBloc.close();
    query.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: movieBloc,
      builder: (context, state) {
        String displayText = '';

        if (state is MovieLoaded) {
            displayText =
                'Title: ${state.searchmovie?.title}';
        }

        print('Display Text: $query');


        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  movieBloc.add(SearchMovieEvent(query: query.text));
                },
              ),
              Expanded(
                child: TextFormField(
                  controller: query,
                  decoration: InputDecoration(
                    hintText: 'Chercher un film...',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        query.clear();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                displayText,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
