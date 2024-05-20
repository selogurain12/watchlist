// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class FilmEnCoursResponseEntity extends Equatable {
  final String? id;
  final String? id_film;
  final int? tempsvisionnage;

  const FilmEnCoursResponseEntity({this.id, this.id_film, this.tempsvisionnage});

  @override
  List<Object?> get props => [id, id_film, tempsvisionnage];
}

class CreateFilmEnCoursRequestEntity extends Equatable {
  final String? id_film;
  final UserRequestModel? user;
  final int? tempsvisionnage;

  const CreateFilmEnCoursRequestEntity(
      {this.id_film, this.user, this.tempsvisionnage});

  @override
  List<Object?> get props => [id_film, user, tempsvisionnage];
}

class UpdateFilmEnCoursRequestEntity extends Equatable {
  final int? tempsvisionnage;

  const UpdateFilmEnCoursRequestEntity({this.tempsvisionnage});

  @override
  List<Object?> get props => [tempsvisionnage];
}

class AllFilmEnCoursResponseEntity extends Equatable {
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

  const AllFilmEnCoursResponseEntity({
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
  });

  @override
  List<Object?> get props => [
      id,
      backdrop_path,
      genre_ids,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title,
      budget,
      homepage,
      companiesname,
      companieslogo,
      revenue,
      runtime,
      vote_average,
      tempsvisionnage
      ];
}
