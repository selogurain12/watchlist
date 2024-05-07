// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bibliotheques_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BibliothequeResponseModel _$BibliothequeResponseModelFromJson(
        Map<String, dynamic> json) =>
    BibliothequeResponseModel(
      id: json['id'] as String?,
      nom: json['nom'] as String?,
      id_livres: (json['id_livres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BibliothequeResponseModelToJson(
        BibliothequeResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'id_livres': instance.id_livres,
      'users': instance.users,
    };

CreateBibliothequeRequestModel _$CreateBibliothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateBibliothequeRequestModel(
      nom: json['nom'] as String?,
      id_livres: (json['id_livres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateBibliothequeRequestModelToJson(
        CreateBibliothequeRequestModel instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'id_livres': instance.id_livres,
      'users': instance.users,
    };

DeleteLivreRequestModel _$DeleteLivreRequestModelFromJson(
        Map<String, dynamic> json) =>
    DeleteLivreRequestModel(
      livreIds: (json['livreIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DeleteLivreRequestModelToJson(
        DeleteLivreRequestModel instance) =>
    <String, dynamic>{
      'livreIds': instance.livreIds,
    };
