// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'filmencours_model.g.dart';

@JsonSerializable()
class FilmEnCoursResponseModel extends FilmEnCoursResponseEntity {
  final String? id;
  final String? id_film;
  final int? tempsvisionnage;

  const FilmEnCoursResponseModel({
    this.id,
    this.id_film,
    this.tempsvisionnage,
  }) : super(
          id: id,
          id_film: id_film,
          tempsvisionnage: tempsvisionnage,
        );

  factory FilmEnCoursResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FilmEnCoursResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmEnCoursResponseModelToJson(this);

  factory FilmEnCoursResponseModel.fromEntity(
      FilmEnCoursResponseEntity entity) {
    return FilmEnCoursResponseModel(
        id: entity.id,
        id_film: entity.id_film,
        tempsvisionnage: entity.tempsvisionnage);
  }
}

@JsonSerializable()
class CreateFilmEnCoursRequestModel extends CreateFilmEnCoursRequestEntity {
  final String? id_film;
  final UserRequestModel? user;
  final int? tempsvisionnage;

  const CreateFilmEnCoursRequestModel(
      {this.id_film, this.user, this.tempsvisionnage})
      : super(
          id_film: id_film,
          user: user,
          tempsvisionnage: tempsvisionnage,
        );

  factory CreateFilmEnCoursRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateFilmEnCoursRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFilmEnCoursRequestModelToJson(this);

  factory CreateFilmEnCoursRequestModel.fromEntity(
      CreateFilmEnCoursRequestEntity entity) {
    return CreateFilmEnCoursRequestModel(
        id_film: entity.id_film,
        user: entity.user,
        tempsvisionnage: entity.tempsvisionnage);
  }
}

@JsonSerializable()
class UpdateFilmEnCoursRequestModel extends UpdateFilmEnCoursRequestEntity {
  final int? tempsvisionnage;

  const UpdateFilmEnCoursRequestModel({this.tempsvisionnage})
      : super(
          tempsvisionnage: tempsvisionnage,
        );

  factory UpdateFilmEnCoursRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateFilmEnCoursRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateFilmEnCoursRequestModelToJson(this);

  factory UpdateFilmEnCoursRequestModel.fromEntity(
      UpdateFilmEnCoursRequestEntity entity) {
    return UpdateFilmEnCoursRequestModel(
        tempsvisionnage: entity.tempsvisionnage);
  }
}

@JsonSerializable()
class AllFilmEnCoursResponseModel extends AllFilmEnCoursResponseEntity {
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
  final int? tempsvisionnage;

  const AllFilmEnCoursResponseModel({
    this.id,
    this.title,
    this.backdrop_path,
    this.genre_ids,
    this.original_language,
    this.original_title,
    this.budget,
    this.companiesname,
    this.companieslogo,
    this.homepage,
    this.overview,
    this.poster_path,
    this.release_date,
    this.revenue,
    this.runtime,
    this.vote_average,
    this.tempsvisionnage
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
    vote_average: vote_average,
    tempsvisionnage: tempsvisionnage
  );

  factory AllFilmEnCoursResponseModel.fromJson(Map<String, dynamic> json) =>
    _$AllFilmEnCoursResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllFilmEnCoursResponseModelToJson(this);

  factory AllFilmEnCoursResponseModel.fromEntity(AllFilmEnCoursResponseEntity entity) {
    return AllFilmEnCoursResponseModel(
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
      vote_average: entity.vote_average,
      tempsvisionnage: entity.tempsvisionnage
    );
  }
}
