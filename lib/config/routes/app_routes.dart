import 'package:whashlist/features/book/presentation/pages/searchbook_screen.dart';
import 'package:whashlist/features/movie/presentation/pages/addmovie_screen.dart';
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
      builder: (context, state) => const AddmovieScreen(),
    ),
  ],
);