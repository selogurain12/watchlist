import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/features/movie/presentation/bloc/searchmovie_bloc.dart';
import 'package:whashlist/features/movie/presentation/bloc/searchmovie_event.dart';
import 'package:whashlist/features/movie/presentation/bloc/searchmovie_state.dart';
import 'package:whashlist/injection_container.dart';

class SearchMovie extends StatefulWidget {
  const SearchMovie({super.key});

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  late SearchMovieBloc movieBloc;
  late TextEditingController query;

  @override
  void initState() {
    super.initState();
    movieBloc = sl<SearchMovieBloc>();
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
                    movieBloc.add(SearchMoviesEvent(query: query.text));
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
            child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
              bloc: movieBloc,
              builder: (context, state) {
                if (state is SearchMovieLoaded) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Nombre de colonnes
                      childAspectRatio: 0.8, // Ratio pour la taille des enfants
                      crossAxisSpacing: 5, // Espacement horizontal
                      mainAxisSpacing: 5, // Espacement vertical
                    ),
                    itemCount: state.searchmovie?.length ?? 0,
                    itemBuilder: (context, index) {
                      final movie = state.searchmovie?[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
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
                              const SizedBox(height: 8),
                              Text(movie.title ?? 'Titre inconnu',
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is SearchMovieError) {
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