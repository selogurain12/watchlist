import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';
import 'package:whashlist/features/user/domain/repositories/user_repository.dart';

class SearchUseCase implements UseCase<DataState<SearchUserResponseEntity>, SearchUserRequestEntity> {
  final UserRepository repository;
  const SearchUseCase(this.repository);
  
  @override
  Future<DataState<SearchUserResponseEntity>> call({SearchUserRequestEntity? params}) {
    return repository.searchuser(
      body: params,
    );
  }
}