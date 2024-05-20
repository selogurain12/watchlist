import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class StatsRepository {
  Future<DataState<StatsResponseEntity>> updatestats({
    String? id,
    StatsRequestEntity? body,
  });

  Future<DataState<StatsResponseEntity>> stats({
    UserRequestEntity? body,
  });
}