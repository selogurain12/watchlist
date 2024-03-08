import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';

abstract class StatsRepository {
  Future<DataState<UpdateStatsResponseEntity>> updatestats({
    UpdateStatsRequestEntity? body,
  });
}