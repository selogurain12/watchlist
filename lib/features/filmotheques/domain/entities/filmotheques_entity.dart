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