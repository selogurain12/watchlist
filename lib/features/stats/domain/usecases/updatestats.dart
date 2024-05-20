import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';

class UpdateStatsUseCase
    implements UseCase<DataState<StatsResponseEntity>, UpdateStatsParam> {
  final StatsRepository repository;
  const UpdateStatsUseCase(this.repository);

  @override
  Future<DataState<StatsResponseEntity>> call({UpdateStatsParam? params}) {
    return repository.updatestats(
      id: params?.id,
      body: params?.stats,
    );
  }
}

class UpdateStatsParam {
  final String? id;
  final StatsRequestEntity? stats;

  UpdateStatsParam({this.id, this.stats});
}
