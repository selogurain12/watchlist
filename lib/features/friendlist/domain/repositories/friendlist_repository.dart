import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class FriendlistRepository {
  Future<DataState<FriendlistResponseEntity>> addfriend({
    String? iduser,
    FriendlistRequestEntity? body,
  });

  Future<DataState<List<FriendlistResponseEntity>>> listfriend({
    UserRequestEntity? body,
  });

  Future<DataState<UserResponseModel>> searchuser({
    String? username,
  });

  Future<DataState<void>> deletefriend({
    String? idfriend,
  });
}