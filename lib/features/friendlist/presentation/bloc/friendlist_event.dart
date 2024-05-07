// ignore_for_file: non_constant_identifier_names

import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';

abstract class FriendlistEvent {
  const FriendlistEvent();
}

class AddFriendEvent extends FriendlistEvent {
  final String? iduser;
  final FriendlistRequestEntity? friends;

  const AddFriendEvent({this.iduser, this.friends});
}

class ListFriendEvent extends FriendlistEvent {
  final String? id;
  final String? username;
  final String? nom;
  final String? prenom;
  final String? mail;

  const ListFriendEvent({
    this.id,
    this.mail,
    this.nom,
    this.prenom,
    this.username,
  });
}

class SearchUserEvent extends FriendlistEvent {
  final String? username;

  const SearchUserEvent({
    this.username,
  });
}

class DeleteFriendEvent extends FriendlistEvent {
  final String? idfriend;

  const DeleteFriendEvent({
    this.idfriend,
  });
}
