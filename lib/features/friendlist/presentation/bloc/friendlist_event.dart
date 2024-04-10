// ignore_for_file: non_constant_identifier_names

abstract class FriendlistEvent {
  const FriendlistEvent();
}

class AddFriendEvent extends FriendlistEvent {
  final String? userprincipal;
  final String? user2;

  const AddFriendEvent({
    this.userprincipal,
    this.user2
  });
}

class ListFriendEvent extends FriendlistEvent {
  final String? userprincipal;

  const ListFriendEvent({
    this.userprincipal,
  });
}

class SearchFriendEvent extends FriendlistEvent {
  final String? userprincipal;
  final String? user2;

  const SearchFriendEvent({
    this.userprincipal,
    this.user2,
  });
}

class DeleteFriendEvent extends FriendlistEvent {
  final String? userprincipal;
  final String? user2;

  const DeleteFriendEvent({
    this.userprincipal,
    this.user2,
  });
}
