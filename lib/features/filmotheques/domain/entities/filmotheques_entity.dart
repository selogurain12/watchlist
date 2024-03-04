// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class FilmothequesRequestEntity extends Equatable {
  final String? id;

  const FilmothequesRequestEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}

class FilmothequesResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? id_user;

  const FilmothequesResponseEntity({
    this.id,
    this.nom,
    this.id_user
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    id_user
  ];
}

class AddFilmothequeRequestEntity extends Equatable {
  final String? nom;
  final String? id_user;

  const AddFilmothequeRequestEntity({
    this.nom,
    this.id_user
  });

  @override
  List<Object?> get props => [
    nom,
    id_user,
  ];
}

class FilmFilmothequeRequestEntity extends Equatable {
  final String? id_filmotheque;
  final String? id_film;

  const FilmFilmothequeRequestEntity({
    this.id_film,
    this.id_filmotheque,
  });

  @override
  List<Object?> get props => [
    id_film,
    id_filmotheque
  ];
}

class FilmFilmothequeResponseEntity extends Equatable {
  final String? id;
  final String? id_film;
  final String? id_filmotheque;

  const FilmFilmothequeResponseEntity({
    this.id,
    this.id_film,
    this.id_filmotheque
  });

  @override
  List<Object?> get props => [
    id,
    id_film,
    id_filmotheque
  ];
}