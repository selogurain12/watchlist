import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
     return Scaffold(
      body: Column(
        children: [
          Padding(
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
                  child: TextField(
                    controller: query,
                    decoration: InputDecoration(
                      hintText: 'Chercher un film...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => query.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              bloc: movieBloc,
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieLoaded) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Nombre de colonnes
                      childAspectRatio: 0.7, // Ratio pour la taille des enfants
                      crossAxisSpacing: 8, // Espacement horizontal
                      mainAxisSpacing: 8, // Espacement vertical
                    ),
                    itemCount: state.searchmovie?.length ?? 0,
                    itemBuilder: (context, index) {
                      final movie = state.searchmovie?[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.go("/detailsmovie", extra: movie);
                                  },
                                  child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie!.poster_path}",
                                  fit: BoxFit.cover,
                                ),
                                )
                              ),
                              SizedBox(height: 8),
                              Text(movie.title ?? 'Titre inconnu',
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is MovieError) {
                  return const Center(child: Text('Erreur de chargement'));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}