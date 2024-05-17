import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/presentation/pages/listbook_screen.dart';
import 'package:whashlist/features/bibliotheques/presentation/pages/viewfilmo_screen.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/book/presentation/pages/detailsbook_screen.dart';
import 'package:whashlist/features/book/presentation/pages/searchbook_screen.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/presentation/pages/listmovie_screen.dart';
import 'package:whashlist/features/filmotheques/presentation/pages/viewfilmo_screen.dart';
import 'package:whashlist/features/filmtermine/presentation/pages/listfilmtermine_screen.dart';
import 'package:whashlist/features/livreencours/presentation/pages/listlivreencours_screen.dart';
import 'package:whashlist/features/livretermine/presentation/pages/listlivretermine_screen.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/movie/presentation/pages/searchmovie_screen.dart';
import 'package:whashlist/features/movie/presentation/pages/detailsmovie_screen.dart';
import 'package:whashlist/features/stats/presentation/pages/stats_screen.dart';
import 'package:whashlist/features/user/presentation/pages/compte_screen.dart';
import 'package:whashlist/features/user/presentation/pages/connected_screen.dart';
import 'package:whashlist/features/user/presentation/pages/film_screen.dart';
import 'package:whashlist/features/user/presentation/pages/livre_screen.dart';
import 'package:whashlist/features/user/presentation/pages/login_screen.dart';
import 'package:whashlist/features/user/presentation/pages/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/features/user/presentation/pages/home_screen.dart';

final router = GoRouter(
  routes : [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/livre',
      builder: (context, state) => const LivreScreen(),
    ),
    GoRoute(
      path: '/film',
      builder: (context, state) => const FilmScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/addbook',
      builder: (context, state) => const SearchbookScreen(),
    ),
    GoRoute(
      path: '/addmovie',
      builder: (context, state) => const SearchmovieScreen(),
    ),
    GoRoute(
      path: '/detailsbook',
      builder: ((context, state) {
        final book = state.extra as ApiBookResponseEntity;
        return DetailsbookScreen(book: book);
      }) 
    ),
    GoRoute(
      path: '/detailsmovie',
      builder: ((context, state) {
        final movie = state.extra as SearchMovieResponseEntity;
        return DetailsmovieScreen(movie: movie);
      }) 
    ),
    GoRoute(
      path: '/connected',
      builder: (context, state) => const ConnectedScreen(),
    ),
    GoRoute(
      path: '/compte',
      builder: (context, state) => const CompteScreen(),
    ),
    GoRoute(
      path: '/stats',
      builder: (context, state) => const StatsScreen(),
    ),
    GoRoute(
      path: '/filmotheque',
      builder: (context, state) => const ViewfilmoScreen(),
    ),
    GoRoute(
      path: '/listefilms',
      builder: ((context, state) {
        final filmotheques = state.extra as FilmothequeResponseEntity;
        return ListmovieScreen(filmotheque: filmotheques);
      }) 
    ),
    GoRoute(
      path: '/bibliotheque',
      builder: (context, state) => const ViewbiblioScreen(),
    ),
    GoRoute(
      path: '/listebooks',
      builder: ((context, state) {
        final bibliotheque = state.extra as BibliothequeResponseEntity;
        return ListbookScreen(bibliotheque: bibliotheque);
      }) 
    ),
    GoRoute(
      path: '/filmtermine',
      builder: (context, state) => const ListFilmTermineScreen(),
    ),
    GoRoute(
      path: '/livretermine',
      builder: (context, state) => const ListLivreTermineScreen(),
    ),
    GoRoute(
      path: '/livreencours',
      builder: (context, state) => const ListLivreEnCoursScreen(),
    ),
  ],
);