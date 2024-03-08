import 'package:dio/dio.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';

abstract class StatsState {
  final UpdateStatsResponseEntity? updatestats;
  final DioException? error;

  const StatsState({
    this.error,
    this.updatestats,
  });
}

class StatsLoading extends StatsState {
  const StatsLoading();
}

class StatsLoaded extends StatsState {
  const StatsLoaded({UpdateStatsResponseEntity? updatestats}) : super(updatestats: updatestats);
}

class StatsError extends StatsState {
  const StatsError(DioException? error) : super(error: error);
}