// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/filmtermine/domain/entities/filmtermine_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'filmtermine_model.g.dart';

@JsonSerializable()
class FilmTermineResponseModel extends FilmTermineResponseEntity {
  final String? id;
  final String? id_film;
  final UserResponseModel? user;

  const FilmTermineResponseModel({
    this.id,
    this.id_film,
    this.user,
}): super(
    id: id,
    id_film: id_film,
    user: user,
  );

  factory FilmTermineResponseModel.fromJson(Map<String, dynamic> json) =>
    _$FilmTermineResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmTermineResponseModelToJson(this);

  factory FilmTermineResponseModel.fromEntity(FilmTermineResponseEntity entity) {
    return FilmTermineResponseModel(
      id: entity.id,
      id_film: entity.id_film,
      user: entity.user
    );
  }
}

@JsonSerializable()
class CreateFilmTermineRequestModel extends CreateFilmTermineRequestEntity {
  final String? id_film;
  final UserRequestModel? user;

  const CreateFilmTermineRequestModel({
    this.id_film,
    this.user
}): super(
    id_film: id_film,
    user: user,
  );

  factory CreateFilmTermineRequestModel.fromJson(Map<String, dynamic> json) =>
    _$CreateFilmTermineRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFilmTermineRequestModelToJson(this);

  factory CreateFilmTermineRequestModel.fromEntity(CreateFilmTermineRequestEntity entity) {
    return CreateFilmTermineRequestModel(
      id_film: entity.id_film,
      user: entity.user
    );
  }
}
