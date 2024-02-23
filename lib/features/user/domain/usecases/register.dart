import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';
import 'package:whashlist/features/user/domain/repositories/user_repository.dart';

class RegisterUseCase implements UseCase<DataState<RegisterUserResponseEntity>, RegisterUserRequestEntity> {
  final UserRepository repository;
  const RegisterUseCase(this.repository);
  
  @override
  Future<DataState<RegisterUserResponseEntity>> call({RegisterUserRequestEntity? params}) {
    return repository.register(
      body: params,
    );
  }
}