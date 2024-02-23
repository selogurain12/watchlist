// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserRequestModel _$LoginUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    LoginUserRequestModel(
      mail: json['mail'] as String?,
      mdp: json['mdp'] as String?,
    );

Map<String, dynamic> _$LoginUserRequestModelToJson(
        LoginUserRequestModel instance) =>
    <String, dynamic>{
      'mail': instance.mail,
      'mdp': instance.mdp,
    };

LoginUserResponseModel _$LoginUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    LoginUserResponseModel(
      nom: json['nom'] as String?,
      mail: json['mail'] as String?,
      mdp: json['mdp'] as String?,
      prenom: json['prenom'] as String?,
    );

Map<String, dynamic> _$LoginUserResponseModelToJson(
        LoginUserResponseModel instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'mail': instance.mail,
      'mdp': instance.mdp,
      'prenom': instance.prenom,
    };

RegisterUserRequestModel _$RegisterUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterUserRequestModel(
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      mail: json['mail'] as String?,
      mdp: json['mdp'] as String?,
    );

Map<String, dynamic> _$RegisterUserRequestModelToJson(
        RegisterUserRequestModel instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'prenom': instance.prenom,
      'mail': instance.mail,
      'mdp': instance.mdp,
    };

RegisterUserResponseModel _$RegisterUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterUserResponseModel(
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      mail: json['mail'] as String?,
      mdp: json['mdp'] as String?,
    );

Map<String, dynamic> _$RegisterUserResponseModelToJson(
        RegisterUserResponseModel instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'prenom': instance.prenom,
      'mail': instance.mail,
      'mdp': instance.mdp,
    };

SearchUserRequestModel _$SearchUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    SearchUserRequestModel(
      id: json['id'] as int?,
      prenom: json['prenom'] as String?,
      nom: json['nom'] as String?,
      mail: json['mail'] as String?,
      mdp: json['mdp'] as String?,
    );

Map<String, dynamic> _$SearchUserRequestModelToJson(
        SearchUserRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'mail': instance.mail,
      'mdp': instance.mdp,
    };

SearchUserResponseModel _$SearchUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchUserResponseModel(
      id: json['id'] as int?,
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      mail: json['mail'] as String?,
      mdp: json['mdp'] as String?,
    );

Map<String, dynamic> _$SearchUserResponseModelToJson(
        SearchUserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'mail': instance.mail,
      'mdp': instance.mdp,
    };
