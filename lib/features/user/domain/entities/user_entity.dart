import 'package:equatable/equatable.dart';

class LoginUserRequestEntity extends Equatable {
  final String? mail;
  final String? mdp;

  const LoginUserRequestEntity({
    this.mail,
    this.mdp,
  });

  @override
  List<Object?> get props => [
    mail,
    mdp,
  ];
}

class LoginUserResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;

  const LoginUserResponseEntity({
    this.id,
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    prenom,
    mail,
    mdp
  ];
}

class RegisterUserRequestEntity extends Equatable {
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;

  const RegisterUserRequestEntity({
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  });

  @override
  List<Object?> get props => [
    nom,
    prenom,
    mail,
    mdp,
  ];
}

class RegisterUserResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;

  const RegisterUserResponseEntity({
    this.id,
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    prenom,
    mail,
    mdp,
  ];
}

class SearchUserRequestEntity extends Equatable {
  final int? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;

  const SearchUserRequestEntity({
    this.id,
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    prenom,
    mail,
    mdp,
  ];
}

class SearchUserResponseEntity extends Equatable {
  final int? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;

  const SearchUserResponseEntity({
    this.id,
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    prenom,
    mail,
    mdp,
  ];
}