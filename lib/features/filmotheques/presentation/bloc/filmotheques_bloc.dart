import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/addfilmotheque.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/addmovie.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/filmotheques.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';

class FilmothequesBloc extends Bloc<FilmothequeEvent, FilmothequesState> {
  final FilmothequesUseCase filmothequesUseCase;
  final AddFilmothequeUseCase addfilmothequeUseCase;
  final FilmFilmothequeUseCase filmfilmothequeUseCase;

  FilmothequesBloc(
    this.filmothequesUseCase,
    this.addfilmothequeUseCase,
    this.filmfilmothequeUseCase,
  ) : super(const FilmothequesLoading()) {
    on<FilmothequesEvent>(filmotheques);
    on<AddFilmothequeEvent>(addfilmotheque);
    on<FilmFilmothequeEvent>(addmovie);
  }

  void filmotheques(FilmothequesEvent event, Emitter<FilmothequesState> emit) async {
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

  void addfilmotheque(AddFilmothequeEvent event, Emitter<FilmothequesState> emit) async {
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

  void addmovie(FilmFilmothequeEvent event, Emitter<FilmothequesState> emit) async {
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
}