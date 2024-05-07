// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class BibliothequeResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final List<String>? id_livres;
  final List<UserRequestModel>? users;

  const BibliothequeResponseEntity({
    this.id,
    this.nom,
    this.id_livres,
    this.users
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    id_livres,
    users
  ];
}

class CreateBibliothequeRequestEntity extends Equatable {
  final String? nom;
  final List<String>? id_livres;
  final List<UserRequestModel>? users;

  const CreateBibliothequeRequestEntity({
    this.nom,
    this.id_livres,
    this.users
  });

  @override
  List<Object?> get props => [
    nom,
    id_livres,
    users
  ];
}

class DeleteLivreRequestEntity extends Equatable {
  final List<String>? livreIds;

  const DeleteLivreRequestEntity({
    this.livreIds,
  });

  @override
  List<Object?> get props => [
    livreIds
  ];
}