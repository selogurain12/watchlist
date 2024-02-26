
// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class ApiMovieRequestEntity extends Equatable {
  final String? query;

  const ApiMovieRequestEntity({
    this.query,
  });

  @override
  List<Object?> get props => [
    query,
  ];
}

class ApiMovieResponseEntity extends Equatable {
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


  const ApiMovieResponseEntity({
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
    this.vote_average
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
    vote_average
  ];
}