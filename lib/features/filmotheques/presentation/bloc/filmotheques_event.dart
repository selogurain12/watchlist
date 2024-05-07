// ignore_for_file: non_constant_identifier_names
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class FilmothequeEvent {
  const FilmothequeEvent();
}

class DeleteMovieEvent extends FilmothequeEvent {
  final String? id;
  final DeleteFilmRequestEntity? filmIds;

  const DeleteMovieEvent({this.id, this.filmIds});
}

class CreateFilmothequeEvent extends FilmothequeEvent {
  final String? nom;
  final List<UserRequestModel>? users;

  const CreateFilmothequeEvent({
    this.nom,
    this.users,
  });
}

class DeleteUserinFilmothequeEvent extends FilmothequeEvent {
  final String? id_filmotheque;
  final UserRequestEntity? user;

  const DeleteUserinFilmothequeEvent(
      {this.id_filmotheque,
      this.user});
}

class DeleteFilmothequeEvent extends FilmothequeEvent {
  final String? id_filmotheque;

  const DeleteFilmothequeEvent({
    this.id_filmotheque,
  });
}

class ListFilmothequeEvent extends FilmothequeEvent {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? username;

  const ListFilmothequeEvent(
      {this.id, this.nom, this.mail, this.prenom, this.username});
}

class ListFilmEvent extends FilmothequeEvent {
  final String? id_filmotheque;

  const ListFilmEvent({
    this.id_filmotheque,
  });
}

class ModifieFilmothequeEvent extends FilmothequeEvent {
  final String? id_filmotheque;
  final String? nom;
  final List<UserRequestModel>? users;
  final List<String>? id_films;

  const ModifieFilmothequeEvent(
      {this.id_filmotheque, this.nom, this.id_films, this.users});
}
