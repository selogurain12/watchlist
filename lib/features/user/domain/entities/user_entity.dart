import 'package:equatable/equatable.dart';

class LoginUserRequestEntity extends Equatable {
  final String? username;
  final String? mdp;

  const LoginUserRequestEntity({
    this.username,
    this.mdp,
  });

  @override
  List<Object?> get props => [
    username,
    mdp,
  ];
}

class LoginUserResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? username;

  const LoginUserResponseEntity({
    this.id,
    this.nom,
    this.prenom,
    this.mail,
    this.username,
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    prenom,
    mail,
    username,
  ];
}

class RegisterUserRequestEntity extends Equatable {
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;
  final String? username;

  const RegisterUserRequestEntity({
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
    this.username,
  });

  @override
  List<Object?> get props => [
    nom,
    prenom,
    mail,
    mdp,
    username
  ];
}

class RegisterUserResponseEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? username;

  const RegisterUserResponseEntity({
    this.id,
    this.nom,
    this.prenom,
    this.mail,
    this.username,
  });

  @override
  List<Object?> get props => [
    id,
    nom,
    prenom,
    mail,
    username,
  ];
}