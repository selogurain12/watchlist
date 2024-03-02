// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filmotheques_model.g.dart';

@JsonSerializable()
class FilmothequesRequestModel extends FilmothequesRequestEntity {
  final String? id;

  const FilmothequesRequestModel({
    this.id,
}): super(
    id: id,
  );

  factory FilmothequesRequestModel.fromJson(Map<String, dynamic> json) =>
    _$FilmothequesRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmothequesRequestModelToJson(this);

  factory FilmothequesRequestModel.fromEntity(FilmothequesRequestEntity entity) {
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

  const FilmothequesResponseModel({
    this.id,
    this.nom,
    this.id_user
}): super(
    id: id,
    nom: nom,
    id_user: id_user
  );

  factory FilmothequesResponseModel.fromJson(Map<String, dynamic> json) =>
    _$FilmothequesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmothequesResponseModelToJson(this);

  factory FilmothequesResponseModel.fromEntity(FilmothequesResponseEntity entity) {
    return FilmothequesResponseModel(
      id: entity.id,
      nom: entity.nom,
      id_user: entity.id_user,
    );
  }
}