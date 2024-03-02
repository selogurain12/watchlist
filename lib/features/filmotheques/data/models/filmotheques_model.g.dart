// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmotheques_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmothequesRequestModel _$FilmothequesRequestModelFromJson(
        Map<String, dynamic> json) =>
    FilmothequesRequestModel(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FilmothequesRequestModelToJson(
        FilmothequesRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

FilmothequesResponseModel _$FilmothequesResponseModelFromJson(
        Map<String, dynamic> json) =>
    FilmothequesResponseModel(
      id: json['id'] as String?,
      nom: json['nom'] as String?,
      id_user: json['id_user'] as String?,
    );

Map<String, dynamic> _$FilmothequesResponseModelToJson(
        FilmothequesResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'id_user': instance.id_user,
    };
