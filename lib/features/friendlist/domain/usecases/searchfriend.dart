import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class SearchFriendUseCase implements UseCase<DataState<UserResponseModel>, String> {
  final FriendlistRepository repository;
  const SearchFriendUseCase(this.repository);
  
  @override
  Future<DataState<UserResponseModel>> call({String? params}) {
    return repository.searchuser(
      username: params,
    );
  }
}