// ignore_for_file: non_constant_identifier_names

import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class BibliothequeEvent {
  const BibliothequeEvent();
}

class DeleteBookEvent extends BibliothequeEvent {
  final String? id;
  final DeleteLivreRequestEntity? livreIds;

  const DeleteBookEvent({this.id, this.livreIds});
}

class CreateBibliothequeEvent extends BibliothequeEvent {
  final String? nom;
  final List<UserRequestModel>? users;

  const CreateBibliothequeEvent({
    this.nom,
    this.users,
  });
}

class DeleteUserinBibliothequeEvent extends BibliothequeEvent {
  final String? id_bibliotheque;
  final UserRequestEntity? user;

  const DeleteUserinBibliothequeEvent(
      {this.id_bibliotheque,
      this.user});
}

class DeleteBibliothequeEvent extends BibliothequeEvent {
  final String? id_bibliotheque;

  const DeleteBibliothequeEvent({
    this.id_bibliotheque,
  });
}

class ListBibliothequeEvent extends BibliothequeEvent {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? username;

  const ListBibliothequeEvent(
      {this.id, this.nom, this.mail, this.prenom, this.username});
}

class ListLivreEvent extends BibliothequeEvent {
  final String? id_bibliotheque;

  const ListLivreEvent({
    this.id_bibliotheque,
  });
}

class ModifieBibliothequeEvent extends BibliothequeEvent {
  final String? id_bibliotheque;
  final String? nom;
  final List<UserRequestModel>? users;
  final List<String>? id_livres;

  const ModifieBibliothequeEvent(
      {this.id_bibliotheque, this.nom, this.id_livres, this.users});
}
