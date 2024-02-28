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
      id: json['id'] as String?,
      nom: json['nom'] as String?,
      mail: json['mail'] as String?,
      prenom: json['prenom'] as String?,
    );

Map<String, dynamic> _$LoginUserResponseModelToJson(
        LoginUserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'mail': instance.mail,
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
