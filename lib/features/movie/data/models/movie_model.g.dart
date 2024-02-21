// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMovieRequestModel _$ApiMovieRequestModelFromJson(
        Map<String, dynamic> json) =>
    ApiMovieRequestModel(
      query: json['query'] as String?,
    );

Map<String, dynamic> _$ApiMovieRequestModelToJson(
        ApiMovieRequestModel instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

ApiMovieResponseModel _$ApiMovieResponseModelFromJson(
        Map<String, dynamic> json) =>
    ApiMovieResponseModel(
      id: json['id'] as int?,
      backdrop_path: json['backdrop_path'] as String?,
      genre_ids: json['genre_ids'] as List<dynamic>?,
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      overview: json['overview'] as String?,
      poster_path: json['poster_path'] as String?,
      release_date: json['release_date'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ApiMovieResponseModelToJson(
        ApiMovieResponseModel instance) =>
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
    };
