// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class FriendlistRequestEntity extends Equatable {
  final List<UserRequestModel>? friends;

  const FriendlistRequestEntity({
    this.friends,
  });

  @override
  List<Object?> get props => [
    friends,
  ];
}

class FriendlistResponseEntity extends Equatable {
  final String? id;
  final List<UserResponseModel>? friends;

  const FriendlistResponseEntity({
    this.id,
    this.friends,
  });

  @override
  List<Object?> get props => [
    id,
    friends,
  ];
}
