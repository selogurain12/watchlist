import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_state.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class StatsUser extends StatefulWidget {
  const StatsUser({Key? key}) : super(key: key);

  @override
  State<StatsUser> createState() => _StatsUserState();
}

class _StatsUserState extends State<StatsUser> {
  late StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    statsBloc = sl<StatsBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    statsBloc.add(StatsEvent(
        id: userProvider.userId,
        nom: userProvider.userNom,
        prenom: userProvider.userPrenom,
        username: userProvider.userUsername));
  }

  @override
  void dispose() {
    super.dispose();
    statsBloc.close();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<StatsBloc, StatsState>(
      bloc: statsBloc,
      builder: (context, state) {
        if (state is StatsLoaded) {
          final stats = state.stats;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.go("/compte");
                        },
                        child: const Icon(Icons.arrow_back_rounded),
                      ),
                    ],
                  ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Temps de visionnage",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          formatRuntime(stats?.tempsvu),
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Nombre de pages lus",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          stats?.pageslu != null ? stats!.pageslu.toString() : '0',
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Nombre de filmothèques",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          stats?.filmotheque != null ? stats!.filmotheque.toString() : '0',
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Nombre de bibliothèques",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          stats?.bibliotheque != null ? stats!.bibliotheque.toString() : '0',
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Nombre de films en cours",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          stats?.filmEnCours != null ? stats!.filmEnCours.toString() : '0',
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Nombre de livres en cours",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          stats?.livreEnCours != null ? stats!.livreEnCours.toString() : '0',
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Nombre de films terminés",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          stats?.filmsTermine != null ? stats!.filmsTermine.toString() : '0',
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150.0, // Augmentez la hauteur pour accommoder le texte supplémentaire
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE5CB), // Couleur de fond
                      borderRadius: BorderRadius.circular(10), // Arrondi des angles
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                          spreadRadius: 5, // Étendue de l'ombre
                          blurRadius: 7, // Flou de l'ombre
                          offset: const Offset(0, 3), // Décalage de l'ombre
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement dans la colonne
                      children: [
                        const Text(
                          "Nombre de livres terminés",
                          style: TextStyle(
                            fontSize: 20.0, // Taille de la police
                            fontWeight: FontWeight.bold, // Gras
                          ),
                        ),
                        const SizedBox(height: 10.0), // Espacement vertical entre les textes
                        Text(
                          stats?.livresTermine != null ? stats!.livresTermine.toString() : '0',
                          style: const TextStyle(
                            fontSize: 16.0, // Taille de la police
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  String formatRuntime(int? runtime) {
    int hours = runtime! ~/ 60;
    int minutes = runtime % 60;
    String formattedRuntime = '$hours h ${minutes}min';

    return formattedRuntime;
  }
}
