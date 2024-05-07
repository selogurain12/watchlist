// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class FilmothequeResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final List<String>? id_films;
  final List<UserRequestModel>? users;

  const FilmothequeResponseEntity({
    this.id,
    this.nom,
    this.id_films,
    this.users
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    id_films,
    users
  ];
}

class CreateFilmothequeRequestEntity extends Equatable {
  final String? nom;
  final List<String>? id_films;
  final List<UserRequestModel>? users;

  const CreateFilmothequeRequestEntity({
    this.nom,
    this.id_films,
    this.users
  });

  @override
  List<Object?> get props => [
    nom,
    id_films,
    users
  ];
}

class DeleteFilmRequestEntity extends Equatable {
  final List<String>? filmIds;

  const DeleteFilmRequestEntity({
    this.filmIds,
  });

  @override
  List<Object?> get props => [
    filmIds
  ];
}