// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'filmotheques_model.g.dart';

@JsonSerializable()
class FilmothequeResponseModel extends FilmothequeResponseEntity {
  final String? id;
  final String? nom;
  final List<String>? id_films;
  final List<UserRequestModel>? users;

  const FilmothequeResponseModel({
    this.id,
    this.nom,
    this.id_films,
    this.users
}): super(
    id: id,
    nom: nom,
    id_films: id_films,
    users: users,
  );

  factory FilmothequeResponseModel.fromJson(Map<String, dynamic> json) =>
    _$FilmothequeResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmothequeResponseModelToJson(this);

  factory FilmothequeResponseModel.fromEntity(FilmothequeResponseEntity entity) {
    return FilmothequeResponseModel(
      id: entity.id,
      nom: entity.nom,
      id_films: entity.id_films,
      users: entity.users
    );
  }
}

@JsonSerializable()
class CreateFilmothequeRequestModel extends CreateFilmothequeRequestEntity {
  final String? nom;
  final List<String>? id_films;
  final List<UserRequestModel>? users;

  const CreateFilmothequeRequestModel({
    this.nom,
    this.id_films,
    this.users
}): super(
    nom: nom,
    id_films: id_films,
    users: users,
  );

  factory CreateFilmothequeRequestModel.fromJson(Map<String, dynamic> json) =>
    _$CreateFilmothequeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFilmothequeRequestModelToJson(this);

  factory CreateFilmothequeRequestModel.fromEntity(CreateFilmothequeRequestEntity entity) {
    return CreateFilmothequeRequestModel(
      nom: entity.nom,
      id_films: entity.id_films,
      users: entity.users
    );
  }
}

@JsonSerializable()
class DeleteFilmRequestModel extends DeleteFilmRequestEntity {
  final List<String>? filmIds;

  const DeleteFilmRequestModel({
    this.filmIds,
}): super(
    filmIds: filmIds,
  );

  factory DeleteFilmRequestModel.fromJson(Map<String, dynamic> json) =>
    _$DeleteFilmRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteFilmRequestModelToJson(this);

  factory DeleteFilmRequestModel.fromEntity(DeleteFilmRequestEntity entity) {
    return DeleteFilmRequestModel(
      filmIds: entity.filmIds
    );
  }
}
