import 'package:flutter/material.dart';
import 'package:whashlist/features/movie/domain/entities/movie_entity.dart'; // Assurez-vous que le chemin est correct

class DetailMovie extends StatefulWidget {
  final ApiMovieResponseEntity movie;
  const DetailMovie({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailMovie> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailMovie> {
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.movie.title ?? 'Détails du film'),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.movie.backdrop_path != null)
            Image.network(
              "https://image.tmdb.org/t/p/original/${widget.movie.poster_path}",
              width: 200,
              fit: BoxFit.cover,
            ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Titre: ${widget.movie.title}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Genre(s): ${widget.movie.genre_ids?.join(', ') ?? 'Inconnu'}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Titre original: ${widget.movie.original_title ?? 'Pas de titre original disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Langue originale: ${widget.movie.original_language ?? "Pas de langue originale disponible."}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Synopsis: ${widget.movie.overview ?? 'Pas de synopsis disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                 Image.network(
                  "https://image.tmdb.org/t/p/original/${widget.movie.backdrop_path}",
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Date de sortie: ${widget.movie.release_date ?? 'Pas de date de sortie disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Budget: ${widget.movie.budget ?? 'Pas de budget disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Page d\'accueil: ${widget.movie.homepage ?? 'Pas de page d\'accueil disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Nom de la companie de production: ${widget.movie.companiesname ?? 'Pas de nom de la companie de production disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Logo de la companie de production: ${widget.movie.companieslogo ?? 'Pas de logo de la companie de production disponible.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Revenus: ${widget.movie.revenue ?? 'Pas de revenus disponibles.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Durée: ${widget.movie.runtime ?? 'Pas de durée disponibles.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Moyenne de vote: ${widget.movie.vote_average ?? 'Pas de moyenne de vote disponibles.'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}