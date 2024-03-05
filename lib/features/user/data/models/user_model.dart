// ignore_for_file: annotate_overrides, overridden_fields

import 'package:whashlist/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class LoginUserRequestModel extends LoginUserRequestEntity {
  final String? username;
  final String? mdp;

  const LoginUserRequestModel({
    this.username,
    this.mdp,
}): super(
    username: username,
    mdp: mdp,
  );

  factory LoginUserRequestModel.fromJson(Map<String, dynamic> json) =>
    _$LoginUserRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUserRequestModelToJson(this);

  factory LoginUserRequestModel.fromEntity(LoginUserRequestEntity entity) {
    return LoginUserRequestModel(
      username: entity.username,
      mdp: entity.mdp,
    );
  }
}

@JsonSerializable()
class LoginUserResponseModel extends LoginUserResponseEntity {

  final String? id;
  final String? nom;
  final String? mail;
  final String? prenom;
  final String? username;

  const LoginUserResponseModel({
    this.id,
    this.nom,
    this.mail,
    this.prenom,
    this.username,
}): super(
    id: id,
    nom: nom,
    mail: mail,
    prenom: prenom,
    username: username,
  );

  factory LoginUserResponseModel.fromJson(Map<String, dynamic> json) =>
    _$LoginUserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUserResponseModelToJson(this);

  factory LoginUserResponseModel.fromEntity(LoginUserResponseEntity entity) {
    return LoginUserResponseModel(
      id: entity.id,
      nom: entity.nom,
      mail: entity.mail,
      prenom: entity.prenom,
      username: entity.username,
    );
  }
}

@JsonSerializable()
class RegisterUserRequestModel extends RegisterUserRequestEntity {
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;
  final String? username;
  
  
  const RegisterUserRequestModel({
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
    this.username,
  }): super(
    nom: nom,
    prenom: prenom,
    mail: mail,
    mdp: mdp,
    username: username,
  );

  factory RegisterUserRequestModel.fromJson(Map<String, dynamic> json) =>
    _$RegisterUserRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterUserRequestModelToJson(this);

  factory RegisterUserRequestModel.fromEntity(RegisterUserRequestEntity entity) {
    return RegisterUserRequestModel(
      nom: entity.nom,
      prenom: entity.prenom,
      mail: entity.mail,
      mdp: entity.mdp,
      username: entity.username,
    );
  }
}

@JsonSerializable()
class RegisterUserResponseModel extends RegisterUserResponseEntity {

  final String? nom;
  final String? prenom;
  final String? mail;
  final String? username;


  const RegisterUserResponseModel({
    this.nom,
    this.prenom,
    this.mail,
    this.username,
}) : super(
    nom: nom,
    prenom: prenom,
    mail: mail,
    username: username,
  );

    factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json) =>
    _$RegisterUserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterUserResponseModelToJson(this);

  factory RegisterUserResponseModel.fromEntity(RegisterUserResponseEntity entity) {
    return RegisterUserResponseModel(
      nom: entity.nom,
      prenom: entity.prenom,
      mail: entity.mail,
      username: entity.username,
    );
  }
}