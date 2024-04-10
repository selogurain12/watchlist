import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/addfilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/addmovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deletefilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/deletemoviefilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/filmotheques.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/listfilmothequemovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/renamefilmotheque.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';

class FilmothequesBloc extends Bloc<FilmothequeEvent, FilmothequesState> {
  final FilmothequesUseCase filmothequesUseCase;
  final AddFilmothequeUseCase addfilmothequeUseCase;
  final FilmFilmothequeUseCase filmfilmothequeUseCase;
  final ListFilmFilmothequeUseCase listfilmfilmothequeUseCase;
  final RenameFilmothequeUseCase renamefilmothequeUseCase;
  final DeleteFilmothequeUseCase deletefilmothequeUseCase;
  final DeleteMovieFilmothequeUseCase deletemoviefilmothequeUseCase;

  FilmothequesBloc(
    this.filmothequesUseCase,
    this.addfilmothequeUseCase,
    this.filmfilmothequeUseCase,
    this.listfilmfilmothequeUseCase,
    this.renamefilmothequeUseCase,
    this.deletefilmothequeUseCase,
    this.deletemoviefilmothequeUseCase,
  ) : super(const FilmothequesLoading()) {
    on<FilmothequesEvent>(filmotheques);
    on<AddFilmothequeEvent>(addfilmotheque);
    on<FilmFilmothequeEvent>(addmovie);
    on<ListFilmFilmothequeEvent>(filmothequemovie);
    on<RenameFilmothequeEvent>(renamefilmotheque);
    on<DeleteFilmothequeEvent>(deletefilmotheque);
    on<DeleteMovieFilmothequeEvent>(deletemoviefilmotheque);
  }

  void filmotheques(
      FilmothequesEvent event, Emitter<FilmothequesState> emit) async {
    emit(const FilmothequesLoading());
    final data = await filmothequesUseCase(
      params: FilmothequesRequestEntity(
        id: event.id,
      ),
    );

    if (data is DataSuccess) {
      emit(FilmothequesLoaded(filmotheques: data.data));
    }

    if (data is DataFailure) {
      emit(FilmothequesError(data.error));
    }
  }

  void addfilmotheque(
      AddFilmothequeEvent event, Emitter<FilmothequesState> emit) async {
    emit(const FilmothequesLoading());
    final data = await addfilmothequeUseCase(
      params: AddFilmothequeRequestEntity(
        nom: event.nom,
        id_user: event.id_user,
      ),
    );

    if (data is DataSuccess) {
      emit(AddFilmothequeLoaded(addfilmotheque: data.data));
    }

    if (data is DataFailure) {
      emit(FilmothequesError(data.error));
    }
  }

  void addmovie(
      FilmFilmothequeEvent event, Emitter<FilmothequesState> emit) async {
    emit(const FilmothequesLoading());
    final data = await filmfilmothequeUseCase(
      params: FilmFilmothequeRequestEntity(
        id_film: event.id_film,
        id_filmotheque: event.id_filmotheque,
      ),
    );

    if (data is DataSuccess) {
      emit(FilmFilmothequeLoaded(addmovie: data.data));
    }

    if (data is DataFailure) {
      emit(FilmFilmothequeError(data.error));
    }
  }

  void filmothequemovie(
      ListFilmFilmothequeEvent event, Emitter<FilmothequesState> emit) async {
    emit(const FilmothequesLoading());
    final data = await listfilmfilmothequeUseCase(
      params: ListFilmFilmothequeRequestEntity(
        id_filmotheque: event.id_filmotheque,
      ),
    );

    if (data is DataSuccess) {
      emit(ListFilmFilmothequeLoaded(filmothequemovie: data.data));
    }

    if (data is DataFailure) {
      emit(ListFilmFilmothequeError(data.error));
    }
  }

  void renamefilmotheque(
      RenameFilmothequeEvent event, Emitter<FilmothequesState> emit) async {
    emit(const FilmothequesLoading());
    final data = await renamefilmothequeUseCase(
      params: FilmothequeRequestEntity(
          id: event.id, nom: event.nom, id_user: event.id_user),
    );

    if (data is DataSuccess) {
      emit(RenameFilmothequeLoaded(renamefilmotheque: data.data));
    }

    if (data is DataFailure) {
      emit(RenameFilmothequeError(data.error));
    }
  }

  void deletefilmotheque(
      DeleteFilmothequeEvent event, Emitter<FilmothequesState> emit) async {
    emit(const FilmothequesLoading());
    final data = await deletefilmothequeUseCase(
      params: ListFilmFilmothequeRequestEntity(
        id_filmotheque: event.id_filmotheque,
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteFilmothequeLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteFilmothequeError(data.error));
    }
  }

  void deletemoviefilmotheque(DeleteMovieFilmothequeEvent event,
      Emitter<FilmothequesState> emit) async {
    emit(const FilmothequesLoading());
    final data = await deletemoviefilmothequeUseCase(
      params: FilmFilmothequeRequestEntity(
        id_filmotheque: event.id_filmotheque,
        id_film: event.id_movie
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteMovieFilmothequeLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteMovieFilmothequeError(data.error));
    }
  }
}
