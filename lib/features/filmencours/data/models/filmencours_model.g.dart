// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmencours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmEnCoursResponseModel _$FilmEnCoursResponseModelFromJson(
        Map<String, dynamic> json) =>
    FilmEnCoursResponseModel(
      id: json['id'] as String?,
      id_film: json['id_film'] as String?,
      tempsvisionnage: json['tempsvisionnage'] as int?,
    );

Map<String, dynamic> _$FilmEnCoursResponseModelToJson(
        FilmEnCoursResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_film': instance.id_film,
      'tempsvisionnage': instance.tempsvisionnage,
    };

CreateFilmEnCoursRequestModel _$CreateFilmEnCoursRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateFilmEnCoursRequestModel(
      id_film: json['id_film'] as String?,
      user: json['user'] == null
          ? null
          : UserRequestModel.fromJson(json['user'] as Map<String, dynamic>),
      tempsvisionnage: json['tempsvisionnage'] as int?,
    );

Map<String, dynamic> _$CreateFilmEnCoursRequestModelToJson(
        CreateFilmEnCoursRequestModel instance) =>
    <String, dynamic>{
      'id_film': instance.id_film,
      'user': instance.user,
      'tempsvisionnage': instance.tempsvisionnage,
    };

UpdateFilmEnCoursRequestModel _$UpdateFilmEnCoursRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateFilmEnCoursRequestModel(
      tempsvisionnage: json['tempsvisionnage'] as int?,
    );

Map<String, dynamic> _$UpdateFilmEnCoursRequestModelToJson(
        UpdateFilmEnCoursRequestModel instance) =>
    <String, dynamic>{
      'tempsvisionnage': instance.tempsvisionnage,
    };

AllFilmEnCoursResponseModel _$AllFilmEnCoursResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllFilmEnCoursResponseModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      backdrop_path: json['backdrop_path'] as String?,
      genre_ids: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      budget: json['budget'] as int?,
      companiesname: (json['companiesname'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      companieslogo: (json['companieslogo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      homepage: json['homepage'] as String?,
      overview: json['overview'] as String?,
      poster_path: json['poster_path'] as String?,
      release_date: json['release_date'] as String?,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      tempsvisionnage: json['tempsvisionnage'] as int?,
    );

Map<String, dynamic> _$AllFilmEnCoursResponseModelToJson(
        AllFilmEnCoursResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdrop_path,
      'genre_ids': instance.genre_ids,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'budget': instance.budget,
      'homepage': instance.homepage,
      'companiesname': instance.companiesname,
      'companieslogo': instance.companieslogo,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'vote_average': instance.vote_average,
      'tempsvisionnage': instance.tempsvisionnage,
    };
