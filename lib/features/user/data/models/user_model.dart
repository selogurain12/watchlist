// ignore_for_file: annotate_overrides, overridden_fields

import 'package:whashlist/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class LoginUserRequestModel extends LoginUserRequestEntity {
  final String? mail;
  final String? mdp;

  const LoginUserRequestModel({
    this.mail,
    this.mdp,
}): super(
    mail: mail,
    mdp: mdp,
  );

  factory LoginUserRequestModel.fromJson(Map<String, dynamic> json) =>
    _$LoginUserRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUserRequestModelToJson(this);

  factory LoginUserRequestModel.fromEntity(LoginUserRequestEntity entity) {
    return LoginUserRequestModel(
      mail: entity.mail,
      mdp: entity.mdp,
    );
  }
}

@JsonSerializable()
class LoginUserResponseModel extends LoginUserResponseEntity {

  final String? nom;
  final String? mail;
  final String? mdp;
  final String? prenom;

  const LoginUserResponseModel({
    this.nom,
    this.mail,
    this.mdp,
    this.prenom,
}): super(
    nom: nom,
    mail: mail,
    mdp: mdp,
    prenom: prenom,
  );

  factory LoginUserResponseModel.fromJson(Map<String, dynamic> json) =>
    _$LoginUserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUserResponseModelToJson(this);

  factory LoginUserResponseModel.fromEntity(LoginUserResponseEntity entity) {
    return LoginUserResponseModel(
      nom: entity.nom,
      mail: entity.mail,
      mdp: entity.mdp,
      prenom: entity.prenom,
    );
  }
}

@JsonSerializable()
class RegisterUserRequestModel extends RegisterUserRequestEntity {
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;
  
  
  const RegisterUserRequestModel({
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  }): super(
    nom: nom,
    prenom: prenom,
    mail: mail,
    mdp: mdp,
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
    );
  }
}

@JsonSerializable()
class RegisterUserResponseModel extends RegisterUserResponseEntity {

  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;


  const RegisterUserResponseModel({
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
}) : super(
    nom: nom,
    prenom: prenom,
    mail: mail,
    mdp: mdp,
  );

    factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json) =>
    _$RegisterUserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterUserResponseModelToJson(this);

  factory RegisterUserResponseModel.fromEntity(RegisterUserResponseEntity entity) {
    return RegisterUserResponseModel(
      nom: entity.nom,
      prenom: entity.prenom,
      mail: entity.mail,
      mdp: entity.mdp,
    );
  }
}