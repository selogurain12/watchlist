import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/createfilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deletefilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deletemovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deleteuserinfilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/listfilmotheques.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/listmovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/modifiefilmotheque.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class FilmothequesBloc extends Bloc<FilmothequeEvent, FilmothequeState> {
  final DeleteFilmUseCase deleteMovieUseCase;
  final CreateFilmothequeUseCase createfilmothequeUseCase;
  final DeleteUserinFilmothequeUseCase deleteuserinfilmothequeUseCase;
  final DeleteFilmothequeUseCase deletefilmothequeUseCase;
  final ListFilmothequeUseCase listFilmothequeUseCase;
  final ListFilmUseCase listFilmUseCase;
  final ModifieFilmothequeUseCase modifieFilmothequeUseCase;

  FilmothequesBloc(
    this.deleteMovieUseCase,
    this.createfilmothequeUseCase,
    this.deleteuserinfilmothequeUseCase,
    this.deletefilmothequeUseCase,
    this.listFilmothequeUseCase,
    this.listFilmUseCase,
    this.modifieFilmothequeUseCase,
  ) : super(const FilmothequeLoading()) {
    on<DeleteMovieEvent>(deletemovie);
    on<CreateFilmothequeEvent>(createfilmotheque);
    on<DeleteUserinFilmothequeEvent>(deleteuserinfilmotheque);
    on<DeleteFilmothequeEvent>(deletefilmotheque);
    on<ListFilmothequeEvent>(listfilmotheque);
    on<ListFilmEvent>(listfilm);
    on<ModifieFilmothequeEvent>(modifiefilmotheque);
  }

  void deletemovie(
      DeleteMovieEvent event, Emitter<FilmothequeState> emit) async {
    emit(const FilmothequeLoading());
    final data = await deleteMovieUseCase(
      params: DeleteMovieParams(
        idfilmotheque: event.id,
        body: event.filmIds,
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteMovieLoaded(deletemovie: data.data));
    }

    if (data is DataFailure) {
      emit(DeleteFilmError(data.error));
    }
  }

  void createfilmotheque(
      CreateFilmothequeEvent event, Emitter<FilmothequeState> emit) async {
    emit(const FilmothequeLoading());
    final data = await createfilmothequeUseCase(
      params: CreateFilmothequeRequestEntity(
        nom: event.nom,
        users: event.users,
      ),
    );

    if (data is DataSuccess) {
      emit(CreateFilmothequeLoaded(createfilmotheque: data.data));
    }

    if (data is DataFailure) {
      emit(CreateFilmothequeError(data.error));
    }
  }

  void deleteuserinfilmotheque(
      DeleteUserinFilmothequeEvent event, Emitter<FilmothequeState> emit) async {
    emit(const FilmothequeLoading());
    final data = await deleteuserinfilmothequeUseCase(
      params: DeleteUserInFilmothequeParams(
        idfilmotheque: event.id_filmotheque,
        body: event.user,
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteUserinFilmothequeLoaded(deleteuserinfilmotheque: data.data));
    }

    if (data is DataFailure) {
      emit(DeleteUserinFilmothequeError(data.error));
    }
  }

  void deletefilmotheque(
      DeleteFilmothequeEvent event, Emitter<FilmothequeState> emit) async {
    emit(const FilmothequeLoading());
    final data = await deletefilmothequeUseCase(
      params: event.id_filmotheque,
    );

    if (data is DataSuccess) {
      emit(DeleteFilmothequeLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteFilmothequeError(data.error));
    }
  }

  void listfilmotheque(
      ListFilmothequeEvent event, Emitter<FilmothequeState> emit) async {
    emit(const FilmothequeLoading());
    final data = await listFilmothequeUseCase(
      params: UserRequestEntity(
          id: event.id, 
          nom: event.nom, 
          prenom: event.prenom,
          mail: event.mail,
          username: event.username
          ),
    );

    if (data is DataSuccess) {
      emit(ListFilmothequeLoaded(listfilmotheque: data.data));
    }

    if (data is DataFailure) {
      emit(ListFilmothequeError(data.error));
    }
  }

  void listfilm(
      ListFilmEvent event, Emitter<FilmothequeState> emit) async {
    emit(const FilmothequeLoading());
    final data = await listFilmUseCase(
      params: event.id_filmotheque,
    );

    if (data is DataSuccess) {
      emit(ListFilmLoaded(listmovie: data.data));
    }

    if (data is DataFailure) {
      emit(ListFilmError(data.error));
    }
  }

  void modifiefilmotheque(ModifieFilmothequeEvent event,
      Emitter<FilmothequeState> emit) async {
    emit(const FilmothequeLoading());
    final data = await modifieFilmothequeUseCase(
      params: ModifieFilmothequeParams(
        idfilmotheque: event.id_filmotheque,
        body: CreateFilmothequeRequestEntity(
          id_films: event.id_films,
          users: event.users,
          nom: event.nom
        ),
      ),
    );

    if (data is DataSuccess) {
      emit(ModifieFilmothequeLoaded(modifiefilmotheque: data.data));
    }

    if (data is DataFailure) {
      emit(ModifieFilmothequeError(data.error));
    }
  }
}
