import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';

class AddFriendUseCase implements UseCase<DataState<FriendlistResponseEntity>, AddFriendParams> {
  final FriendlistRepository repository;
  const AddFriendUseCase(this.repository);
  
  @override
  Future<DataState<FriendlistResponseEntity>>call({AddFriendParams? params}) {
    return repository.addfriend(
      iduser: params?.iduser,
      body: params?.body,
    );
  }
}

class AddFriendParams {
  final String? iduser;
  final FriendlistRequestEntity? body;

  AddFriendParams({this.iduser, this.body});
}
