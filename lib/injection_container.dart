import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/data/datasource/remote/bibliotheques_remote_datasource.dart';
import 'package:whashlist/features/bibliotheques/data/repositories/bibliotheques_repository_impl.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/createbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deletebibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deletebook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deleteuserinbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/listbibliotheques.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/listbook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/modifiebibliotheque.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_bloc.dart';
import 'package:whashlist/features/book/data/datasource/remote/book_remote_datasource.dart';
import 'package:whashlist/features/book/data/repositories/book_repository_impl.dart';
import 'package:whashlist/features/book/domain/repositories/book_repository.dart';
import 'package:whashlist/features/book/domain/usecases/searchbook.dart';
import 'package:whashlist/features/book/presentation/bloc/book_bloc.dart';
import 'package:whashlist/features/filmotheques/data/datasource/remote/filmotheques_remote_datasource.dart';
import 'package:whashlist/features/filmotheques/data/repositories/filmotheques_repository_impl.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/createfilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deletefilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deletemovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deleteuserinfilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/listfilmotheques.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/listmovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/modifiefilmotheque.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmtermine/data/datasource/remote/filmtermine_remote_datasource.dart';
import 'package:whashlist/features/filmtermine/data/repositories/filmtermine_repository_impl.dart';
import 'package:whashlist/features/filmtermine/domain/repositories/filmtermine_repository.dart';
import 'package:whashlist/features/filmtermine/domain/usecases/createfilmtermine.dart';
import 'package:whashlist/features/filmtermine/domain/usecases/deletefilmtermine.dart';
import 'package:whashlist/features/filmtermine/domain/usecases/listfilmtermine.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_bloc.dart';
import 'package:whashlist/features/friendlist/data/datasource/remote/friendlist_remote_datasource.dart';
import 'package:whashlist/features/friendlist/data/repositories/friendlist_repository_impl.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';
import 'package:whashlist/features/friendlist/domain/usecases/addfriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/deletefriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/listfriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/searchfriend.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_bloc.dart';
import 'package:whashlist/features/livreencours/data/datasource/remote/livreencours_remote_datasource.dart';
import 'package:whashlist/features/livreencours/data/repositories/livreencours_repository_impl.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';
import 'package:whashlist/features/livreencours/domain/usecases/createlivreencours.dart';
import 'package:whashlist/features/livreencours/domain/usecases/deletelivreencours.dart';
import 'package:whashlist/features/livreencours/domain/usecases/listlivreencours.dart';
import 'package:whashlist/features/livreencours/domain/usecases/livreencours.dart';
import 'package:whashlist/features/livreencours/domain/usecases/updatelivreencours.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_bloc.dart';
import 'package:whashlist/features/livretermine/data/datasource/remote/livretermine_remote_datasource.dart';
import 'package:whashlist/features/livretermine/data/repositories/livretermine_repository_impl.dart';
import 'package:whashlist/features/livretermine/domain/repositories/livretermine_repository.dart';
import 'package:whashlist/features/livretermine/domain/usecases/createlivretermine.dart';
import 'package:whashlist/features/livretermine/domain/usecases/deletelivretermine.dart';
import 'package:whashlist/features/livretermine/domain/usecases/listlivretermine.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_bloc.dart';
import 'package:whashlist/features/movie/data/datasource/remote/searchmovie_remote_datasource.dart';
import 'package:whashlist/features/movie/data/repositories/searchmovie_repository_impl.dart';
import 'package:whashlist/features/movie/domain/repositories/searchmovie_repository.dart';
import 'package:whashlist/features/movie/domain/usecases/searchmovie.dart';
import 'package:whashlist/features/movie/presentation/bloc/searchmovie_bloc.dart';
import 'package:whashlist/features/stats/data/datasource/remote/stats_remote_datasource.dart';
import 'package:whashlist/features/stats/data/repositories/stats_repository_impl.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';
import 'package:whashlist/features/stats/domain/usecases/stats.dart';
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
  //Friendlist
  sl.registerSingleton<FriendlistService>(FriendlistService(sl()));
  sl.registerSingleton<FriendlistRepository>(FriendlistRepositoryImpl(sl()));
  //Film termine
  sl.registerSingleton<FilmtermineService>(FilmtermineService(sl()));
  sl.registerSingleton<FilmTermineRepository>(FilmTermineRepositoryImpl(sl()));
  //Livre termine
  sl.registerSingleton<LivretermineService>(LivretermineService(sl()));
  sl.registerSingleton<LivreTermineRepository>(LivreTermineRepositoryImpl(sl()));

  //Livre en cours
  sl.registerSingleton<LivreEnCoursService>(LivreEnCoursService(sl()));
  sl.registerSingleton<LivreEnCoursRepository>(LivreEnCoursRepositoryImpl(sl()));

  /////////////////////////// USECASE ////////////////////////////////////////////
  // User
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  // Book
  sl.registerSingleton<SearchBookUseCase>(SearchBookUseCase(sl()));
  //Movie
  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase(sl()));
  //Filmotheques
  sl.registerSingleton<CreateFilmothequeUseCase>(CreateFilmothequeUseCase(sl()));
  sl.registerSingleton<DeleteUserinFilmothequeUseCase>(DeleteUserinFilmothequeUseCase(sl()));
  sl.registerSingleton<DeleteFilmUseCase>(DeleteFilmUseCase(sl()));
  sl.registerSingleton<ListFilmothequeUseCase>(ListFilmothequeUseCase(sl()));
  sl.registerSingleton<ListFilmUseCase>(ListFilmUseCase(sl()));
  sl.registerSingleton<DeleteFilmothequeUseCase>(DeleteFilmothequeUseCase(sl()));
  sl.registerSingleton<ModifieFilmothequeUseCase>(ModifieFilmothequeUseCase(sl()));
  //Bibliotheques
  sl.registerSingleton<CreateBibliothequeUseCase>(CreateBibliothequeUseCase(sl()));
  sl.registerSingleton<DeleteBookUseCase>(DeleteBookUseCase(sl()));
  sl.registerSingleton<DeleteUserinBibliothequeUseCase>(DeleteUserinBibliothequeUseCase(sl()));
  sl.registerSingleton<ListBibliothequeUseCase>(ListBibliothequeUseCase(sl()));
  sl.registerSingleton<ListLivreUseCase>(ListLivreUseCase(sl()));
  sl.registerSingleton<DeleteBibliothequeUseCase>(DeleteBibliothequeUseCase(sl()));
  sl.registerSingleton<ModifieBibliothequeUseCase>(ModifieBibliothequeUseCase(sl()));
  //Stats
  sl.registerSingleton<UpdateStatsUseCase>(UpdateStatsUseCase(sl()));
  sl.registerSingleton<StatsUseCase>(StatsUseCase(sl()));
  //Film termine
  sl.registerSingleton<CreateFilmtermineUseCase>(CreateFilmtermineUseCase(sl()));
  sl.registerSingleton<DeleteFilmTermineUseCase>(DeleteFilmTermineUseCase(sl()));
  sl.registerSingleton<ListFilmTermineUseCase>(ListFilmTermineUseCase(sl()));
  //Livre termine
  sl.registerSingleton<CreateLivretermineUseCase>(CreateLivretermineUseCase(sl()));
  sl.registerSingleton<DeleteLivreTermineUseCase>(DeleteLivreTermineUseCase(sl()));
  sl.registerSingleton<ListLivreTermineUseCase>(ListLivreTermineUseCase(sl()));
  //Friendlist
  sl.registerSingleton<AddFriendUseCase>(AddFriendUseCase(sl()));
  sl.registerSingleton<ListFriendUseCase>(ListFriendUseCase(sl()));
  sl.registerSingleton<DeleteFriendUseCase>(DeleteFriendUseCase(sl()));
  sl.registerSingleton<SearchFriendUseCase>(SearchFriendUseCase(sl()));
  //Livre en cours
  sl.registerSingleton<CreateLivreEnCoursUseCase>(CreateLivreEnCoursUseCase(sl()));
  sl.registerSingleton<DeleteLivreEnCoursUseCase>(DeleteLivreEnCoursUseCase(sl()));
  sl.registerSingleton<ListLivreEnCoursUseCase>(ListLivreEnCoursUseCase(sl()));
  sl.registerSingleton<LivreEnCoursUseCase>(LivreEnCoursUseCase(sl()));
  sl.registerSingleton<UpdateLivreEnCoursUseCase>(UpdateLivreEnCoursUseCase(sl()));

  /////////////////////////// BLOC ///////////////////////////////////////////////
  // User
  sl.registerFactory<UserBloc>(() => UserBloc(sl(), sl()));
  // Book
  sl.registerFactory<BookBloc>(() => BookBloc(sl()));
  //Movie
  sl.registerFactory<SearchMovieBloc>(() => SearchMovieBloc(sl()));
  //Filmotheques
  sl.registerFactory<FilmothequesBloc>(() => FilmothequesBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  //Bibliotheques
  sl.registerFactory<BibliothequesBloc>(() => BibliothequesBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  //Stats
  sl.registerFactory<StatsBloc>(() => StatsBloc(sl(), sl()));
  //Film termine
  sl.registerFactory<FilmTermineBloc>(() => FilmTermineBloc(sl(), sl(), sl()));
  //Livre termine
  sl.registerFactory<LivreTermineBloc>(() => LivreTermineBloc(sl(), sl(), sl()));
  //Friendlist
  sl.registerFactory<FriendlistBloc>(() => FriendlistBloc(sl(), sl(), sl(), sl()));
  //Livre en cours
  sl.registerFactory<LivreEnCoursBloc>(() => LivreEnCoursBloc(sl(), sl(), sl(), sl(), sl()));
}