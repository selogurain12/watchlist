// ignore_for_file: overridden_fields, annotate_overrides


import 'package:whashlist/features/movie/domain/entities/movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class ApiMovieRequestModel extends ApiMovieRequestEntity {
  final String? query;

  const ApiMovieRequestModel({
    this.query,
}): super(
    query: query,
  );

  factory ApiMovieRequestModel.fromJson(Map<String, dynamic> json) =>
    _$ApiMovieRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiMovieRequestModelToJson(this);

  factory ApiMovieRequestModel.fromEntity(ApiMovieRequestEntity entity) {
    return ApiMovieRequestModel(
      query: entity.query,
    );
  }
}

@JsonSerializable()
class ApiMovieResponseModel extends ApiMovieResponseEntity {
  final int? id;
  final String? backdrop_path;
  final List<String>? genre_ids;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final String? poster_path;
  final String? release_date;
  final String? title;
  final int? budget;
  final String? homepage;
  final List<String>? companiesname;
  final List<String>? companieslogo;
  final int? revenue;
  final int? runtime;
  final double? vote_average;

  const ApiMovieResponseModel({
    this.id,
    this.backdrop_path,
    this.genre_ids,
    this.original_language,
    this.original_title,
    this.overview,
    this.poster_path,
    this.release_date,
    this.title,
    this.budget,
    this.homepage,
    this.companiesname,
    this.companieslogo,
    this.revenue,
    this.runtime,
    this.vote_average,
}): super(
    id: id,
    backdrop_path: backdrop_path,
    genre_ids: genre_ids,
    original_language: original_language,
    original_title: original_title,
    overview: overview,
    poster_path: poster_path,
    release_date: release_date,
    title: title,
    budget: budget,
    homepage: homepage,
    companiesname: companiesname,
    companieslogo: companieslogo,
    revenue: revenue,
    runtime: runtime,
    vote_average: vote_average
  );

  factory ApiMovieResponseModel.fromJson(Map<String, dynamic> json) =>
    _$ApiMovieResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiMovieResponseModelToJson(this);

  factory ApiMovieResponseModel.fromEntity(ApiMovieResponseEntity entity) {
    return ApiMovieResponseModel(
      id: entity.id,
      backdrop_path: entity.backdrop_path,
      genre_ids: entity.genre_ids,
      original_language: entity.original_language,
      original_title: entity.original_title,
      overview: entity.overview,
      poster_path: entity.poster_path,
      release_date: entity.release_date,
      title: entity.title,
      budget: entity.budget,
      homepage: entity.homepage,
      companiesname: entity.companiesname,
      companieslogo: entity.companieslogo,
      revenue: entity.revenue,
      runtime: entity.runtime,
      vote_average: entity.vote_average
    );
  }
}
