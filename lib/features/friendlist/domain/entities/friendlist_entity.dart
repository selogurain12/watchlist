// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class FriendlistRequestEntity extends Equatable {
  final String? userprincipal;
  final String? user2;

  const FriendlistRequestEntity({
    this.userprincipal,
    this.user2
  });

  @override
  List<Object?> get props => [
    userprincipal,
    user2
  ];
}

class FriendlistResponseEntity extends Equatable {
  final String? id;
  final String? userprincipal;
  final String? user2;

  const FriendlistResponseEntity({
    this.id,
    this.userprincipal,
    this.user2
  });

  @override
  List<Object?> get props => [
    id,
    userprincipal,
    user2
  ];
}

class UserPrincipalRequestEntity extends Equatable {
  final String? userprincipal;

  const UserPrincipalRequestEntity({
    this.userprincipal,
  });

  @override
  List<Object?> get props => [
    userprincipal,
  ];
}

class UserFriendRequestEntity extends Equatable {
  final String? userprincipal;
  final String? user2;

  const UserFriendRequestEntity({
    this.userprincipal,
    this.user2,
  });

  @override
  List<Object?> get props => [
    userprincipal,
    user2
  ];
}
