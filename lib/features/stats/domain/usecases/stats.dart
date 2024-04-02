import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';

class StatsUseCase implements UseCase<DataState<StatsResponseEntity>, StatsRequestEntity> {
  final StatsRepository repository;
  const StatsUseCase(this.repository);
  
  @override
  Future<DataState<StatsResponseEntity>> call({StatsRequestEntity? params}) {
    return repository.stats(
      body: params,
    );
  }
}