import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';
import 'package:whashlist/features/user/domain/usecases/login.dart';
import 'package:whashlist/features/user/domain/usecases/register.dart';
import 'package:whashlist/features/user/presentation/bloc/user_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;

  UserBloc(
    this.loginUseCase,
    this.registerUseCase,
  ) : super(const UserLoading()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }

  void register(RegisterEvent event, Emitter<UserState> emit) async {
    final data = await registerUseCase(
      params: RegisterUserRequestEntity(
        nom: event.nom,
        prenom: event.prenom,
        mail: event.mail,
        mdp: event.mdp,
        username: event.username,
      ),
    );

    if (data is DataSuccess) {
      emit(UserLoaded(register: data.data));
    }

    if (data is DataFailure) {
      emit(UserError(error: data.error));
    }
  }

  void login(LoginEvent event, Emitter<UserState> emit) async {
    final data = await loginUseCase(
      params: LoginUserRequestEntity(
        username: event.username,
        mdp: event.mdp,
      ),
    );

    if (data is DataSuccess) {
      emit(UserLoaded(login: data.data));
    }

    if (data is DataFailure) {
      emit(UserError(error: data.error));
    }
  }
}