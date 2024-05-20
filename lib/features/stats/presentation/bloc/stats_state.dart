import 'package:dio/dio.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';

abstract class StatsState {
  final StatsResponseEntity? updatestats;
  final StatsResponseEntity? stats;
  final DioException? error;

  const StatsState({
    this.error,
    this.updatestats,
    this.stats,
  });
}

class StatsLoading extends StatsState {
  const StatsLoading();
}

class UpdateStatsLoaded extends StatsState {
  const UpdateStatsLoaded({StatsResponseEntity? updatestats})
      : super(updatestats: updatestats);
}

class StatsLoaded extends StatsState {
  const StatsLoaded({StatsResponseEntity? stats}) : super(stats: stats);
}

class StatsError extends StatsState {
  const StatsError(DioException? error) : super(error: error);
}

class UpdateStatsError extends StatsState {
  const UpdateStatsError(DioException? error) : super(error: error);
}
