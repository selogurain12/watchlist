import 'package:dio/dio.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class UserState {
  final LoginUserResponseEntity? login;
  final RegisterUserResponseEntity? register;
  final SearchUserResponseEntity? searchuser;
  final DioException? error;

  const UserState({
    this.error,
    this.login,
    this.register,
    this.searchuser,
  });
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  const UserLoaded({LoginUserResponseEntity? login, RegisterUserResponseEntity? register, SearchUserResponseEntity? searchuser}) : super(login: login, register: register);
}

class UserError extends UserState {
  const UserError(DioException? error) : super(error: error);
}