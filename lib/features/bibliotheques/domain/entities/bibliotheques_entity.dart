// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class BibliothequesRequestEntity extends Equatable {
  final String? id;

  const BibliothequesRequestEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}

class BibliothequeRequestEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? id_user;

  const BibliothequeRequestEntity({
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

class BibliothequesResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? id_user;

  const BibliothequesResponseEntity({
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

class AddBibliothequeRequestEntity extends Equatable {
  final String? nom;
  final String? id_user;

  const AddBibliothequeRequestEntity({
    this.nom,
    this.id_user
  });

  @override
  List<Object?> get props => [
    nom,
    id_user,
  ];
}

class LivreBibliothequeRequestEntity extends Equatable {
  final String? id_bibliotheque;
  final String? id_livre;

  const LivreBibliothequeRequestEntity({
    this.id_livre,
    this.id_bibliotheque,
  });

  @override
  List<Object?> get props => [
    id_livre,
    id_bibliotheque
  ];
}

class LivreBibliothequeResponseEntity extends Equatable {
  final String? id;
  final String? id_livre;
  final String? id_bibliotheque;

  const LivreBibliothequeResponseEntity({
    this.id,
    this.id_livre,
    this.id_bibliotheque
  });

  @override
  List<Object?> get props => [
    id,
    id_livre,
    id_bibliotheque
  ];
}

class ListLivreBibliothequeRequestEntity extends Equatable {
  final String? id_bibliotheque;

  const ListLivreBibliothequeRequestEntity({
    this.id_bibliotheque,
  });

  @override
  List<Object?> get props => [
    id_bibliotheque
  ];
}
