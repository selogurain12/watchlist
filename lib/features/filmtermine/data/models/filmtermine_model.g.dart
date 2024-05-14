// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmtermine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmTermineResponseModel _$FilmTermineResponseModelFromJson(
        Map<String, dynamic> json) =>
    FilmTermineResponseModel(
      id: json['id'] as String?,
      id_film: json['id_film'] as String?,
      user: json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilmTermineResponseModelToJson(
        FilmTermineResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_film': instance.id_film,
      'user': instance.user,
    };

CreateFilmTermineRequestModel _$CreateFilmTermineRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateFilmTermineRequestModel(
      id_film: json['id_film'] as String?,
      user: json['user'] == null
          ? null
          : UserRequestModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateFilmTermineRequestModelToJson(
        CreateFilmTermineRequestModel instance) =>
    <String, dynamic>{
      'id_film': instance.id_film,
      'user': instance.user,
    };
