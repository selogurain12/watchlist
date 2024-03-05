// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bibliotheques_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BibliothequesRequestModel _$BibliothequesRequestModelFromJson(
        Map<String, dynamic> json) =>
    BibliothequesRequestModel(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BibliothequesRequestModelToJson(
        BibliothequesRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

BibliothequesResponseModel _$BibliothequesResponseModelFromJson(
        Map<String, dynamic> json) =>
    BibliothequesResponseModel(
      id: json['id'] as String?,
      nom: json['nom'] as String?,
      id_user: json['id_user'] as String?,
    );

Map<String, dynamic> _$BibliothequesResponseModelToJson(
        BibliothequesResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'id_user': instance.id_user,
    };

AddBibliothequeRequestModel _$AddBibliothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddBibliothequeRequestModel(
      nom: json['nom'] as String?,
      id_user: json['id_user'] as String?,
    );

Map<String, dynamic> _$AddBibliothequeRequestModelToJson(
        AddBibliothequeRequestModel instance) =>
    <String, dynamic>{
      'id_user': instance.id_user,
      'nom': instance.nom,
    };

LivreBibliothequeRequestModel _$LivreBibliothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    LivreBibliothequeRequestModel(
      id_livre: json['id_livre'] as String?,
      id_bibliotheque: json['id_bibliotheque'] as String?,
    );

Map<String, dynamic> _$LivreBibliothequeRequestModelToJson(
        LivreBibliothequeRequestModel instance) =>
    <String, dynamic>{
      'id_livre': instance.id_livre,
      'id_bibliotheque': instance.id_bibliotheque,
    };

LivreBibliothequeResponseModel _$LivreBibliothequeResponseModelFromJson(
        Map<String, dynamic> json) =>
    LivreBibliothequeResponseModel(
      id: json['id'] as String?,
      id_livre: json['id_livre'] as String?,
      id_bibliotheque: json['id_bibliotheque'] as String?,
    );

Map<String, dynamic> _$LivreBibliothequeResponseModelToJson(
        LivreBibliothequeResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_livre': instance.id_livre,
      'id_bibliotheque': instance.id_bibliotheque,
    };
