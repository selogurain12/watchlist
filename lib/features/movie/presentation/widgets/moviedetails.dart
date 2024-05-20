// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:whashlist/features/filmencours/presentation/widgets/addmovietofilmencours.dart';
import 'package:whashlist/features/filmtermine/presentation/widgets/addmovietofilmtermine.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/filmotheques/presentation/widgets/addmovietofilmo.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DetailMovie extends StatefulWidget {
  final SearchMovieResponseEntity movie;

  const DetailMovie({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  late StatsBloc statsBloc;
  int? tempsvu;

  @override
  void initState() {
    super.initState();
    statsBloc = sl<StatsBloc>();
    tempsvu = widget.movie.runtime;
  }

  @override
  void dispose() {
    super.dispose();
    statsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/original/${widget.movie.backdrop_path}"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.go("/addmovie");
                        },
                        child: const Icon(Icons.arrow_back_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.movie.backdrop_path != null)
                        Image.network(
                          "https://image.tmdb.org/t/p/original/${widget.movie.poster_path}",
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.movie_creation_outlined),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    '${widget.movie.title}',
                                    style: Theme.of(context).textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Titre original: ${widget.movie.original_title ?? 'Pas de titre original disponible.'}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.record_voice_over_outlined),
                                const SizedBox(width: 5),
                                Text(
                                  'Langue originale: ${widget.movie.original_language}',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month),
                                const SizedBox(width: 5),
                                Text(
                                  'Date de sortie: ${widget.movie.release_date}',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Genre(s): ${widget.movie.genre_ids?.join(', ') ?? 'Inconnu'}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Synopsis: ${widget.movie.overview ?? 'Pas de synopsis disponible.'}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.monetization_on_outlined),
                                const SizedBox(width: 5),
                                Text(
                                  'Budget: ${formatBudget(widget.movie.budget)}',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.language),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    'Page d\'accueil: ${widget.movie.homepage}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.monetization_on_outlined),
                                const SizedBox(width: 5),
                                Text(
                                  'Revenus: ${formatBudget(widget.movie.revenue)}',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.timer),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    'Durée: ${formatRuntime(widget.movie.runtime)}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Moyenne de vote: ',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                buildStarRating(widget.movie.vote_average),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: authProvider.isLoggedIn ? buildSpeedDial() : null,
    );
  }

  String formatRuntime(int? runtime) {
    int hours = runtime! ~/ 60;
    int minutes = runtime % 60;
    String formattedRuntime = '$hours h ${minutes}min';

    return formattedRuntime;
  }

  Widget buildStarRating(double? voteAverage) {
    if (voteAverage == null) return const Text('Pas de moyenne de vote disponibles.');
    int numberOfStars = (voteAverage / 2).round();
    List<Widget> stars = List.generate(
      numberOfStars,
      (index) => const Icon(Icons.star, color: Colors.amber),
    );

    return Row(children: stars);
  }

  String formatRevenue(int? revenue) {
  if (revenue == null) {
    return 'Pas de revenus disponibles.';
  }
  final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
  return formatter.format(revenue);
}
String formatBudget(int? budget) {
  if (budget == null) {
    return 'Pas de revenus disponibles.';
  }
  final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
  return formatter.format(budget);
}
SpeedDial buildSpeedDial() {
  return SpeedDial(
    icon: Icons.add,
    activeIcon: Icons.close,
    buttonSize: Size(56.0, 56.0),
    visible: true,
    curve: Curves.bounceIn,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    tooltip: 'Menu',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 8.0,
    shape: CircleBorder(),
    children: [
      SpeedDialChild(
        child: Icon(Icons.bookmark),
        backgroundColor: Colors.red,
        label: 'Ajouter à une filmothèque',
        labelStyle: TextStyle(fontSize: 16.0),
        onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddMovie(movie: widget.movie);
                              },
                            );
                            if (result != null && result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("La filmothèque a été mise à jour"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
      ),
      SpeedDialChild(
        child: Icon(Icons.timelapse_outlined),
        backgroundColor: Colors.green,
        label: 'Je suis en train de regarder ce film',
        labelStyle: TextStyle(fontSize: 16.0),
        onTap: ()async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddMovieToFilmEnCours(id_film: widget.movie.id.toString(), totalTemps: widget.movie.runtime,);
                              },
                            );
                            if (result != null && result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("La filmothèque a été mise à jour"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
      ),
      SpeedDialChild(
        child: Icon(Icons.done),
        backgroundColor: Colors.blue,
        label: 'J\'ai terminé ce film',
        labelStyle: TextStyle(fontSize: 16.0),
        onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddMovieToFilmTermine(id_film: widget.movie.id.toString(), tempsvisionnage: widget.movie.runtime,);
                              },
                            );
                            if (result != null && result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("La filmothèque a été mise à jour"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
      ),
    ],
  );
}
}
