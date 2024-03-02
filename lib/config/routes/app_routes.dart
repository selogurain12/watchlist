import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/book/presentation/pages/detailsbook_screen.dart';
import 'package:whashlist/features/book/presentation/pages/searchbook_screen.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/movie/presentation/pages/searchmovie_screen.dart';
import 'package:whashlist/features/movie/presentation/pages/detailsmovie_screen.dart';
import 'package:whashlist/features/user/presentation/pages/connected_screen.dart';
import 'package:whashlist/features/user/presentation/pages/login_screen.dart';
import 'package:whashlist/features/user/presentation/pages/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/features/user/presentation/pages/searchuser.dart';
import 'package:whashlist/features/user/presentation/pages/home_screen.dart';

final router = GoRouter(
  routes : [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
     GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
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
  ],
);