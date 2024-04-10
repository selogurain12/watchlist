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

FilmothequeRequestModel _$FilmothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    FilmothequeRequestModel(
      id: json['id'] as String?,
      nom: json['nom'] as String?,
      id_user: json['id_user'] as String?,
    );

Map<String, dynamic> _$FilmothequeRequestModelToJson(
        FilmothequeRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'id_user': instance.id_user,
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

AddFilmothequeRequestModel _$AddFilmothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddFilmothequeRequestModel(
      nom: json['nom'] as String?,
      id_user: json['id_user'] as String?,
    );

Map<String, dynamic> _$AddFilmothequeRequestModelToJson(
        AddFilmothequeRequestModel instance) =>
    <String, dynamic>{
      'id_user': instance.id_user,
      'nom': instance.nom,
    };

FilmFilmothequeRequestModel _$FilmFilmothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    FilmFilmothequeRequestModel(
      id_film: json['id_film'] as String?,
      id_filmotheque: json['id_filmotheque'] as String?,
    );

Map<String, dynamic> _$FilmFilmothequeRequestModelToJson(
        FilmFilmothequeRequestModel instance) =>
    <String, dynamic>{
      'id_film': instance.id_film,
      'id_filmotheque': instance.id_filmotheque,
    };

FilmFilmothequeResponseModel _$FilmFilmothequeResponseModelFromJson(
        Map<String, dynamic> json) =>
    FilmFilmothequeResponseModel(
      id: json['id'] as String?,
      id_film: json['id_film'] as String?,
      id_filmotheque: json['id_filmotheque'] as String?,
    );

Map<String, dynamic> _$FilmFilmothequeResponseModelToJson(
        FilmFilmothequeResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_film': instance.id_film,
      'id_filmotheque': instance.id_filmotheque,
    };

ListFilmFilmothequeRequestModel _$ListFilmFilmothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    ListFilmFilmothequeRequestModel(
      id_filmotheque: json['id_filmotheque'] as String?,
    );

Map<String, dynamic> _$ListFilmFilmothequeRequestModelToJson(
        ListFilmFilmothequeRequestModel instance) =>
    <String, dynamic>{
      'id_filmotheque': instance.id_filmotheque,
    };
