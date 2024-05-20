import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/filmencours/domain/usecases/createfilmencours.dart';
import 'package:whashlist/features/filmencours/domain/usecases/deletefilmencours.dart';
import 'package:whashlist/features/filmencours/domain/usecases/listfilmencours.dart';
import 'package:whashlist/features/filmencours/domain/usecases/filmencours.dart';
import 'package:whashlist/features/filmencours/domain/usecases/updatefilmencours.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_event.dart';
import 'package:whashlist/features/filmencours/presentation/bloc/filmencours_state.dart';

class FilmEnCoursBloc extends Bloc<FilmEnCoursEvent, FilmEnCoursState> {
  final DeleteFilmEnCoursUseCase deletefilmencoursUseCase;
  final CreateFilmEnCoursUseCase createfilmencoursUseCase;
  final ListFilmEnCoursUseCase listfilmencoursUseCase;
  final FilmEnCoursUseCase filmencoursUseCase;
  final UpdateFilmEnCoursUseCase updatefilmencoursUseCase;

  FilmEnCoursBloc(
    this.deletefilmencoursUseCase,
    this.createfilmencoursUseCase,
    this.listfilmencoursUseCase,
    this.updatefilmencoursUseCase,
    this.filmencoursUseCase,
  ) : super(const FilmEnCoursLoading()) {
    on<DeleteFilmEnCoursEvent>(deletefilmencours);
    on<CreateFilmEnCoursEvent>(createfilmencours);
    on<ListFilmEnCoursEvent>(listfilmencours);
    on<FilmsEnCoursEvent>(filmencours);
    on<UpdateFilmEnCoursEvent>(updatefilmencours);
  }

  void deletefilmencours(
      DeleteFilmEnCoursEvent event, Emitter<FilmEnCoursState> emit) async {
    emit(const FilmEnCoursLoading());
    final data = await deletefilmencoursUseCase(
      params: event.id,
    );

    if (data is DataSuccess) {
      emit(DeleteFilmEnCoursLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteFilmEnCoursError(data.error));
    }
  }

  void createfilmencours(
      CreateFilmEnCoursEvent event, Emitter<FilmEnCoursState> emit) async {
    emit(const FilmEnCoursLoading());
    final data = await createfilmencoursUseCase(
      params: CreateFilmEnCoursRequestEntity(
          id_film: event.id_film,
          user: event.user,
          tempsvisionnage: event.tempsvisionnage),
    );
    if (data is DataSuccess) {
      emit(CreateFilmEnCoursLoaded(createfilmencours: data.data));
    }

    if (data is DataFailure) {
      emit(CreateFilmEnCoursError(data.error));
    }
  }

  void listfilmencours(
      ListFilmEnCoursEvent event, Emitter<FilmEnCoursState> emit) async {
    emit(const FilmEnCoursLoading());
    final data = await listfilmencoursUseCase(
      params: event.id,
    );
    if (data is DataSuccess) {
      emit(ListFilmEnCoursLoaded(listfilmencours: data.data));
    }

    if (data is DataFailure) {
      emit(ListFilmEnCoursError(data.error));
    }
  }

  void filmencours(
      FilmsEnCoursEvent event, Emitter<FilmEnCoursState> emit) async {
    emit(const FilmEnCoursLoading());
    final data = await filmencoursUseCase(
      params: event.id,
    );
    if (data is DataSuccess) {
      emit(FilmEnCoursLoaded(filmencours: data.data));
    }

    if (data is DataFailure) {
      emit(FilmsEnCoursError(data.error));
    }
  }

  void updatefilmencours(
      UpdateFilmEnCoursEvent event, Emitter<FilmEnCoursState> emit) async {
    emit(const FilmEnCoursLoading());
    final data = await updatefilmencoursUseCase(
      params: UpdateFilmEnCoursParams(
        id: event.id,
        body: event.update,
      ),
    );
    if (data is DataSuccess) {
      emit(UpdateFilmEnCoursLoaded(updatefilmencours: data.data));
    }

    if (data is DataFailure) {
      emit(UpdateFilmEnCoursError(data.error));
    }
  }
}
