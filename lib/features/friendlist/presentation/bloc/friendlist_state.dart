import 'package:dio/dio.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

abstract class FriendlistState {
  final FriendlistResponseEntity? addfriend;
  final List<FriendlistResponseEntity>? listfriend;
  final UserResponseModel? searchuser;
  final void deletefriend;
  final DioException? error;

  const FriendlistState({
    this.error,
    this.addfriend,
    this.listfriend,
    this.searchuser,
    this.deletefriend,
  });
}

class FriendlistLoading extends FriendlistState {
  const FriendlistLoading();
}

class AddFriendLoaded extends FriendlistState {
  const AddFriendLoaded({FriendlistResponseEntity? addfriend})
      : super(addfriend: addfriend);
}

class ListFriendLoaded extends FriendlistState {
  const ListFriendLoaded({List<FriendlistResponseEntity>? listfriend})
      : super(listfriend: listfriend);
}

class SearchUserLoaded extends FriendlistState {
  const SearchUserLoaded({UserResponseModel? searchuser})
      : super(searchuser: searchuser);
}

class DeleteFriendLoaded extends FriendlistState {
  const DeleteFriendLoaded() : super();
}

class AddFriendError extends FriendlistState {
  final int? statusCode;
  const AddFriendError({DioException? error, this.statusCode})
      : super(error: error);

  // Getter for error message based on status code
  String get errorMessage {
    if (statusCode == 409) {
      return 'Conflict, friend is already added';
    } else if (statusCode == 404) {
      return 'Not Found: User not found';
    } else {
      return 'An error occurred';
    }
  }
}

class ListFriendError extends FriendlistState {
  const ListFriendError(DioException? error) : super(error: error);
}

class SearchUserError extends FriendlistState {
  const SearchUserError(DioException? error) : super(error: error);
}

class DeleteFriendError extends FriendlistState {
  const DeleteFriendError(DioException? error) : super(error: error);
}
