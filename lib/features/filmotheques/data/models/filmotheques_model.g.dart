// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmotheques_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmothequeResponseModel _$FilmothequeResponseModelFromJson(
        Map<String, dynamic> json) =>
    FilmothequeResponseModel(
      id: json['id'] as String?,
      nom: json['nom'] as String?,
      id_films: (json['id_films'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilmothequeResponseModelToJson(
        FilmothequeResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'id_films': instance.id_films,
      'users': instance.users,
    };

CreateFilmothequeRequestModel _$CreateFilmothequeRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateFilmothequeRequestModel(
      nom: json['nom'] as String?,
      id_films: (json['id_films'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateFilmothequeRequestModelToJson(
        CreateFilmothequeRequestModel instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'id_films': instance.id_films,
      'users': instance.users,
    };

DeleteFilmRequestModel _$DeleteFilmRequestModelFromJson(
        Map<String, dynamic> json) =>
    DeleteFilmRequestModel(
      filmIds:
          (json['filmIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DeleteFilmRequestModelToJson(
        DeleteFilmRequestModel instance) =>
    <String, dynamic>{
      'filmIds': instance.filmIds,
    };
