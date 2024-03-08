import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';

class UpdateStatsUseCase implements UseCase<DataState<UpdateStatsResponseEntity>, UpdateStatsRequestEntity> {
  final StatsRepository repository;
  const UpdateStatsUseCase(this.repository);
  
  @override
  Future<DataState<UpdateStatsResponseEntity>> call({UpdateStatsRequestEntity? params}) {
    return repository.updatestats(
      body: params,
    );
  }
}