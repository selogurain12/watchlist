import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/usecases/filmotheques.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';

class FilmothequesBloc extends Bloc<FilmothequesEvent, FilmothequesState> {
  final FilmothequesUseCase filmothequesUseCase;

  FilmothequesBloc(
    this.filmothequesUseCase,
  ) : super(const FilmothequesLoading()) {
    on<FilmothequesEvent>(filmotheques);
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
}