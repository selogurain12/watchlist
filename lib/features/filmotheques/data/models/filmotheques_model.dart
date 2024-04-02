// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
// ignore: unused_import
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

part 'filmotheques_model.g.dart';

@JsonSerializable()
class FilmothequesRequestModel extends FilmothequesRequestEntity {
  final String? id;

  const FilmothequesRequestModel({
    this.id,
  }) : super(
          id: id,
        );

  factory FilmothequesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FilmothequesRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmothequesRequestModelToJson(this);

  factory FilmothequesRequestModel.fromEntity(
      FilmothequesRequestEntity entity) {
    return FilmothequesRequestModel(
      id: entity.id,
    );
  }
}

@JsonSerializable()
class FilmothequesResponseModel extends FilmothequesResponseEntity {
  final String? id;
  final String? nom;
  final String? id_user;

  const FilmothequesResponseModel({this.id, this.nom, this.id_user})
      : super(id: id, nom: nom, id_user: id_user);

  factory FilmothequesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FilmothequesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmothequesResponseModelToJson(this);

  factory FilmothequesResponseModel.fromEntity(
      FilmothequesResponseEntity entity) {
    return FilmothequesResponseModel(
      id: entity.id,
      nom: entity.nom,
      id_user: entity.id_user,
    );
  }
}

@JsonSerializable()
class AddFilmothequeRequestModel extends AddFilmothequeRequestEntity {
  final String? id_user;
  final String? nom;

  const AddFilmothequeRequestModel({
    this.nom,
    this.id_user,
  }) : super(
          nom: nom,
          id_user: id_user,
        );

  factory AddFilmothequeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddFilmothequeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddFilmothequeRequestModelToJson(this);

  factory AddFilmothequeRequestModel.fromEntity(
      AddFilmothequeRequestEntity entity) {
    return AddFilmothequeRequestModel(
      nom: entity.nom,
      id_user: entity.id_user,
    );
  }
}

@JsonSerializable()
class FilmFilmothequeRequestModel extends FilmFilmothequeRequestEntity {
  final String? id_film;
  final String? id_filmotheque;

  const FilmFilmothequeRequestModel({
    this.id_film,
    this.id_filmotheque,
  }) : super(
          id_film: id_film,
          id_filmotheque: id_filmotheque,
        );

  factory FilmFilmothequeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FilmFilmothequeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmFilmothequeRequestModelToJson(this);

  factory FilmFilmothequeRequestModel.fromEntity(
      FilmFilmothequeRequestEntity entity) {
    return FilmFilmothequeRequestModel(
      id_film: entity.id_film,
      id_filmotheque: entity.id_filmotheque,
    );
  }
}

@JsonSerializable()
class FilmFilmothequeResponseModel extends FilmFilmothequeResponseEntity {
  final String? id;
  final String? id_film;
  final String? id_filmotheque;

  const FilmFilmothequeResponseModel(
      {this.id, this.id_film, this.id_filmotheque})
      : super(id: id, id_film: id_film, id_filmotheque: id_filmotheque);

  factory FilmFilmothequeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FilmFilmothequeResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmFilmothequeResponseModelToJson(this);

  factory FilmFilmothequeResponseModel.fromEntity(
      FilmFilmothequeResponseEntity entity) {
    return FilmFilmothequeResponseModel(
      id: entity.id,
      id_film: entity.id_film,
      id_filmotheque: entity.id_filmotheque,
    );
  }
}

@JsonSerializable()
class ListFilmFilmothequeRequestModel extends ListFilmFilmothequeRequestEntity {
  final String? id_filmotheque;

  const ListFilmFilmothequeRequestModel({
    this.id_filmotheque,
  }) : super(
          id_filmotheque: id_filmotheque,
        );

  factory ListFilmFilmothequeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ListFilmFilmothequeRequestModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ListFilmFilmothequeRequestModelToJson(this);

  factory ListFilmFilmothequeRequestModel.fromEntity(
      ListFilmFilmothequeRequestEntity entity) {
    return ListFilmFilmothequeRequestModel(
      id_filmotheque: entity.id_filmotheque,
    );
  }
}
