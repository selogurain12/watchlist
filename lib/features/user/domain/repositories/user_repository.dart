import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<DataState<LoginUserResponseEntity>> login({
    LoginUserRequestEntity? body,
  });

  Future<DataState<RegisterUserResponseEntity>> register({
    RegisterUserRequestEntity? body,
  });
}