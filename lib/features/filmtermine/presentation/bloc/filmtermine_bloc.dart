import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmtermine/domain/entities/filmtermine_entity.dart';
import 'package:whashlist/features/filmtermine/domain/usecases/createfilmtermine.dart';
import 'package:whashlist/features/filmtermine/domain/usecases/deletefilmtermine.dart';
import 'package:whashlist/features/filmtermine/domain/usecases/listfilmtermine.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_event.dart';
import 'package:whashlist/features/filmtermine/presentation/bloc/filmtermine_state.dart';

class FilmTermineBloc extends Bloc<FilmTermineEvent, FilmTermineState> {
  final DeleteFilmTermineUseCase deleteFilmTermineUseCase;
  final CreateFilmtermineUseCase createfilmtermineUseCase;
  final ListFilmTermineUseCase listFilmTermineUseCase;

  FilmTermineBloc(
    this.deleteFilmTermineUseCase,
    this.createfilmtermineUseCase,
    this.listFilmTermineUseCase,
  ) : super(const FilmTermineLoading()) {
    on<DeleteFilmTermineEvent>(deleteFilmTermine);
    on<CreateFilmTermineEvent>(createfilmtermine);
    on<ListFilmTermineEvent>(listFilmTermine);
  }

  void deleteFilmTermine(
      DeleteFilmTermineEvent event, Emitter<FilmTermineState> emit) async {
    emit(const FilmTermineLoading());
    final data = await deleteFilmTermineUseCase(
      params: event.id,
    );

    if (data is DataSuccess) {
      emit(DeleteFilmTermineLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteFilmTermineError(data.error));
    }
  }

  void createfilmtermine(
      CreateFilmTermineEvent event, Emitter<FilmTermineState> emit) async {
    emit(const FilmTermineLoading());
    final data = await createfilmtermineUseCase(
      params: CreateFilmTermineRequestEntity(
        id_film: event.id_film,
        user: event.user,
      ),
    );
    if (data is DataSuccess) {
      emit(CreateFilmTermineLoaded(createfilmtermine: data.data));
    }

    if (data is DataFailure) {
      emit(CreateFilmTermineError(data.error));
    }
  }

  void listFilmTermine(
      ListFilmTermineEvent event, Emitter<FilmTermineState> emit) async {
    emit(const FilmTermineLoading());
    final data = await listFilmTermineUseCase(
      params: event.id,
    );
    if (data is DataSuccess) {
      emit(ListFilmTermineLoaded(listfilmtermine: data.data));
    }

    if (data is DataFailure) {
      emit(ListFilmTermineError(data.error));
    }
  }
}
