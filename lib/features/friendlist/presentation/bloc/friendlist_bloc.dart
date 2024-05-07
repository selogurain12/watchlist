import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/friendlist/domain/usecases/addfriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/deletefriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/listfriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/searchfriend.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_event.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_state.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class FriendlistBloc extends Bloc<FriendlistEvent, FriendlistState> {
  final AddFriendUseCase addfriendUseCase;
  final ListFriendUseCase listfriendUseCase;
  final DeleteFriendUseCase deletefriendUseCase;
  final SearchFriendUseCase searchfriendUseCase;

  FriendlistBloc(
    this.addfriendUseCase,
    this.listfriendUseCase,
    this.deletefriendUseCase,
    this.searchfriendUseCase,
  ) : super(const FriendlistLoading()) {
    on<AddFriendEvent>(addfriend);
    on<ListFriendEvent>(listfriend);
    on<DeleteFriendEvent>(deletefriend);
    on<SearchUserEvent>(searchfriend);
  }

  void addfriend(AddFriendEvent event, Emitter<FriendlistState> emit) async {
    emit(const FriendlistLoading());
    final data = await addfriendUseCase(
      params: AddFriendParams(iduser: event.iduser, body: event.friends),
    );

    if (data is DataSuccess) {
      emit(AddFriendLoaded(addfriend: data.data));
    }

    if (data is DataFailure) {
      emit(AddFriendError(error: data.error));
    }
  }

  void listfriend(ListFriendEvent event, Emitter<FriendlistState> emit) async {
    emit(const FriendlistLoading());
    final data = await listfriendUseCase(
      params: UserRequestModel(
          id: event.id,
          nom: event.nom,
          prenom: event.prenom,
          mail: event.mail,
          username: event.username),
    );
    if (data is DataSuccess) {
      emit(ListFriendLoaded(listfriend: data.data));
    }

    if (data is DataFailure) {
      emit(ListFriendError(data.error));
    }
  }

  void searchfriend(
      SearchUserEvent event, Emitter<FriendlistState> emit) async {
    emit(const FriendlistLoading());
    final data = await searchfriendUseCase(
      params: event.username,
    );

    if (data is DataSuccess) {
      emit(SearchUserLoaded(searchuser: data.data));
    }

    if (data is DataFailure) {
      emit(SearchUserError(data.error));
    }
  }

  void deletefriend(
      DeleteFriendEvent event, Emitter<FriendlistState> emit) async {
    emit(const FriendlistLoading());
    final data = await deletefriendUseCase(
      params: event.idfriend,
    );

    if (data is DataSuccess) {
      // ignore: void_checks
      emit(const DeleteFriendLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteFriendError(data.error));
    }
  }
}
