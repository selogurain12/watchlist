import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/usecases/updatestats.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_state.dart';

class StatsBloc extends Bloc<StatEvent, StatsState> {
  final UpdateStatsUseCase updatestatsUseCase;

  StatsBloc(
    this.updatestatsUseCase,
  ) : super(const StatsLoading()) {
    on<UpdateStatEvent>(updatestats);
  }

  void updatestats(UpdateStatEvent event, Emitter<StatsState> emit) async {
    emit(const StatsLoading());
    final data = await updatestatsUseCase(
      params: UpdateStatsRequestEntity(
        iduser: event.iduser,
        filmsvu: event.filmsvu,
        tempsvu: event.tempsvu,
        livreslu: event.livreslu,
        pageslu: event.pageslu
      ),
    );

    if (data is DataSuccess) {
      emit(StatsLoaded(updatestats: data.data));
    }

    if (data is DataFailure) {
      emit(StatsError(data.error));
    }
  }
}