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
      genre_ids: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      overview: json['overview'] as String?,
      poster_path: json['poster_path'] as String?,
      release_date: json['release_date'] as String?,
      title: json['title'] as String?,
      budget: json['budget'] as int?,
      homepage: json['homepage'] as String?,
      companiesname: (json['companiesname'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      companieslogo: (json['companieslogo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
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
      'budget': instance.budget,
      'homepage': instance.homepage,
      'companiesname': instance.companiesname,
      'companieslogo': instance.companieslogo,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'vote_average': instance.vote_average,
    };
