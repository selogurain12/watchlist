import 'package:dio/dio.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';

abstract class FriendlistState {
  final FriendlistResponseEntity? addfriend;
  final List<FriendlistResponseEntity>? listfriend;
  final FriendlistResponseEntity? searchfriend;
  final void deletefriend;
  final DioException? error;

  const FriendlistState({
    this.error,
    this.addfriend,
    this.listfriend,
    this.searchfriend,
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

class SearchFriendLoaded extends FriendlistState {
  const SearchFriendLoaded({FriendlistResponseEntity? searchfriend})
      : super(searchfriend: searchfriend);
}

class DeleteFriendLoaded extends FriendlistState {
  const DeleteFriendLoaded() : super();
}


class AddFriendError extends FriendlistState {
  final int? statusCode; // Include the status code in UserError
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

class SearchFriendError extends FriendlistState {
  const SearchFriendError(DioException? error) : super(error: error);
}

class DeleteFriendError extends FriendlistState {
  const DeleteFriendError(DioException? error) : super(error: error);
}
