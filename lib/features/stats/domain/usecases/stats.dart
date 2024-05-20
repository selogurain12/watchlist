import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class StatsUseCase implements UseCase<DataState<StatsResponseEntity>, UserRequestEntity> {
  final StatsRepository repository;
  const StatsUseCase(this.repository);
  
  @override
  Future<DataState<StatsResponseEntity>> call({UserRequestEntity? params}) {
    return repository.stats(
      body: params,
    );
  }
}