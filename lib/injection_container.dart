import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/data/datasource/remote/bibliotheques_remote_datasource.dart';
import 'package:whashlist/features/bibliotheques/data/repositories/bibliotheques_repository_impl.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/addbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/addbook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/bibliotheques.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/book/data/datasource/remote/book_remote_datasource.dart';
import 'package:whashlist/features/book/data/repositories/book_repository_impl.dart';
import 'package:whashlist/features/book/domain/repositories/book_repository.dart';
import 'package:whashlist/features/book/domain/usecases/searchbook.dart';
import 'package:whashlist/features/book/presentation/bloc/book_bloc.dart';
import 'package:whashlist/features/filmotheques/data/datasource/remote/filmotheques_remote_datasource.dart';
import 'package:whashlist/features/filmotheques/data/repositories/filmotheques_repository_impl.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/addfilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/addmovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/filmotheques.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/movie/data/datasource/remote/searchmovie_remote_datasource.dart';
import 'package:whashlist/features/movie/data/repositories/searchmovie_repository_impl.dart';
import 'package:whashlist/features/movie/domain/repositories/searchmovie_repository.dart';
import 'package:whashlist/features/movie/domain/usecases/searchmovie.dart';
import 'package:whashlist/features/movie/presentation/bloc/searchmovie_bloc.dart';
import 'package:whashlist/features/stats/data/datasource/remote/stats_remote_datasource.dart';
import 'package:whashlist/features/stats/data/repositories/stats_repository_impl.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';
import 'package:whashlist/features/stats/domain/usecases/updatestats.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:whashlist/features/user/data/datasources/remote/user_remote_datasource.dart';
import 'package:whashlist/features/user/data/repositories/user_repository_impl.dart';
import 'package:whashlist/features/user/domain/repositories/user_repository.dart';
import 'package:whashlist/features/user/domain/usecases/login.dart';
import 'package:whashlist/features/user/domain/usecases/register.dart';
import 'package:whashlist/features/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  //////////////////////////// DEPENDENTIES ///////////////////////////////////////
  // User
  sl.registerSingleton<UserApiService>(UserApiService(sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  // Book
  sl.registerSingleton<BookApiService>(BookApiService(sl()));
  sl.registerSingleton<ApiBookRepository>(ApiBookRepositoryImpl(sl()));
  //Movie
  sl.registerSingleton<SearchMovieService>(SearchMovieService(sl()));
  sl.registerSingleton<SearchMovieRepository>(SearchMovieRepositoryImpl(sl()));
  //Filmotheques
  sl.registerSingleton<FilmothequesService>(FilmothequesService(sl()));
  sl.registerSingleton<FilmothequesRepository>(FilmothequesRepositoryImpl(sl()));
  //Bibliotheque
  sl.registerSingleton<BibliothequesService>(BibliothequesService(sl()));
  sl.registerSingleton<BibliothequesRepository>(BibliothequesRepositoryImpl(sl()));
  //Stats
  sl.registerSingleton<StatsService>(StatsService(sl()));
  sl.registerSingleton<StatsRepository>(StatsRepositoryImpl(sl()));

  /////////////////////////// USECASE ////////////////////////////////////////////
  // User
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  // Book
  sl.registerSingleton<SearchBookUseCase>(SearchBookUseCase(sl()));
  //Movie
  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase(sl()));
  //Filmotheques
  sl.registerSingleton<FilmothequesUseCase>(FilmothequesUseCase(sl()));
  sl.registerSingleton<AddFilmothequeUseCase>(AddFilmothequeUseCase(sl()));
  sl.registerSingleton<FilmFilmothequeUseCase>(FilmFilmothequeUseCase(sl()));
  //Bibliotheques
  sl.registerSingleton<BibliothequesUseCase>(BibliothequesUseCase(sl()));
  sl.registerSingleton<AddBibliothequeUseCase>(AddBibliothequeUseCase(sl()));
  sl.registerSingleton<LivreBibliothequeUseCase>(LivreBibliothequeUseCase(sl()));
  //Stats
  sl.registerSingleton<UpdateStatsUseCase>(UpdateStatsUseCase(sl()));

  /////////////////////////// BLOC ///////////////////////////////////////////////
  // User
  sl.registerFactory<UserBloc>(() => UserBloc(sl(), sl()));
  // Book
  sl.registerFactory<BookBloc>(() => BookBloc(sl()));
  //Movie
  sl.registerFactory<SearchMovieBloc>(() => SearchMovieBloc(sl()));
  //Filmotheques
  sl.registerFactory<FilmothequesBloc>(() => FilmothequesBloc(sl(), sl(), sl()));
  //Bibliotheques
  sl.registerFactory<BibliothequesBloc>(() => BibliothequesBloc(sl(), sl(), sl()));
  //Stats
  sl.registerFactory<StatsBloc>(() => StatsBloc(sl()));
}