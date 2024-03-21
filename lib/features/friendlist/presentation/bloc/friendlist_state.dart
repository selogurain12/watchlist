import 'package:dio/dio.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';

abstract class FriendlistState {
  final FriendlistResponseEntity? addfriend;
  final List<FriendlistResponseEntity>? listfriend;
  final FriendlistResponseEntity? searchfriend;
  final DioException? error;

  const FriendlistState({
    this.error,
    this.addfriend,
    this.listfriend,
    this.searchfriend,
  });
}

class FriendlistLoading extends FriendlistState {
  const FriendlistLoading();
}

class AddFriendLoaded extends FriendlistState {
  const AddFriendLoaded({FriendlistResponseEntity? addfriend }) : super(addfriend: addfriend);
}

class ListFriendLoaded extends FriendlistState {
  const ListFriendLoaded({List<FriendlistResponseEntity>? listfriend}) : super(listfriend: listfriend);
}

class SearchFriendLoaded extends FriendlistState {
  const SearchFriendLoaded({FriendlistResponseEntity? searchfriend}) : super(searchfriend: searchfriend);
}

class AddFriendError extends FriendlistState {
  const AddFriendError(DioException? error) : super(error: error);
}

class ListFriendError extends FriendlistState {
  const ListFriendError(DioException? error) : super(error: error);
}

class SearchFriendError extends FriendlistState {
  const SearchFriendError(DioException? error) : super(error: error);
}