import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/stats/domain/usecases/stats.dart';
import 'package:whashlist/features/stats/domain/usecases/updatestats.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_event.dart';
import 'package:whashlist/features/stats/presentation/bloc/stats_state.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

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
      params: UpdateStatsParam(id: event.id, stats: event.update),
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
      params: UserRequestEntity(
          id: event.id,
          nom: event.nom,
          prenom: event.prenom,
          username: event.username,
          mail: event.mail),
    );

    if (data is DataSuccess) {
      emit(StatsLoaded(stats: data.data));
    }

    if (data is DataFailure) {
      emit(StatsError(data.error));
    }
  }
}
