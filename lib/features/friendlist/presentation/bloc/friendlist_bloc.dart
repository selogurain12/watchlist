import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/usecases/addfriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/listfriend.dart';
import 'package:whashlist/features/friendlist/domain/usecases/searchfriend.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_event.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_state.dart';

class FriendlistBloc extends Bloc<FriendlistEvent, FriendlistState> {
  final AddFriendUseCase addfriendUseCase;
  final ListFriendUseCase listfriendUseCase;
  final SearchFriendUseCase searchfriendUseCase;

  FriendlistBloc(
    this.addfriendUseCase,
    this.listfriendUseCase,
    this.searchfriendUseCase,
  ) : super(const FriendlistLoading()) {
    on<AddFriendEvent>(addfriend);
    on<ListFriendEvent>(listfriend);
    on<SearchFriendEvent>(searchfriend);
  }

  void addfriend(AddFriendEvent event, Emitter<FriendlistState> emit) async {
    emit(const FriendlistLoading());
    final data = await addfriendUseCase(
      params: FriendlistRequestEntity(
        userprincipal: event.userprincipal,
        user2: event.user2
      ),
    );

    if (data is DataSuccess) {
      emit(AddFriendLoaded(addfriend: data.data));
    }

    if (data is DataFailure) {
      emit(AddFriendError(data.error));
    }
  }

  void listfriend(ListFriendEvent event, Emitter<FriendlistState> emit) async {
    emit(const FriendlistLoading());
    final data = await listfriendUseCase(
      params: UserPrincipalRequestEntity(
        userprincipal: event.userprincipal,
      ),
    );

    if (data is DataSuccess) {
      emit(ListFriendLoaded(listfriend: data.data));
    }

    if (data is DataFailure) {
      emit(ListFriendError(data.error));
    }
  }

  void searchfriend(SearchFriendEvent event, Emitter<FriendlistState> emit) async {
    emit(const FriendlistLoading());
    final data = await searchfriendUseCase(
      params: UserFriendRequestEntity(
        userprincipal: event.userprincipal,
        user2: event.user2,
      ),
    );

    if (data is DataSuccess) {
      emit(SearchFriendLoaded(searchfriend: data.data));
    }

    if (data is DataFailure) {
      emit(SearchFriendError(data.error));
    }
  }
}