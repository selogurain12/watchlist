import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/usecases/stats.dart';
import 'package:whashlist/features/stats/domain/usecases/updatestats.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_state.dart';

class StatsBloc extends Bloc<StatEvent, StatsState> {
  final UpdateStatsUseCase updatestatsUseCase;
  final StatsUseCase statsUseCase;

  StatsBloc(
    this.updatestatsUseCase,
    this.statsUseCase,
  ) : super(const StatsLoading()) {
    on<UpdateStatEvent>(updatestats);
    on<StatsEvent>(stats);
  }

  void updatestats(UpdateStatEvent event, Emitter<StatsState> emit) async {
    emit(const StatsLoading());
    final data = await updatestatsUseCase(
      params: UpdateStatsRequestEntity(
          iduser: event.iduser,
          filmsvu: event.filmsvu,
          tempsvu: event.tempsvu,
          livreslu: event.livreslu,
          pageslu: event.pageslu),
    );

    if (data is DataSuccess) {
      emit(UpdateStatsLoaded(updatestats: data.data));
    }

    if (data is DataFailure) {
      emit(UpdateStatsError(data.error));
    }
  }

  void stats(StatsEvent event, Emitter<StatsState> emit) async {
    emit(const StatsLoading());
    final data = await statsUseCase(
      params: StatsRequestEntity(
          id: event.id,
          nom: event.nom,
          prenom: event.prenom,
          username: event.username),
    );

    if (data is DataSuccess) {
      emit(StatsLoaded(stats: data.data));
    }

    if (data is DataFailure) {
      emit(StatsError(data.error));
    }
  }
}
