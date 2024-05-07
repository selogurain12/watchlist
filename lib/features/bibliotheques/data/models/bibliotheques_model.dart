// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'bibliotheques_model.g.dart';

@JsonSerializable()
class BibliothequeResponseModel extends BibliothequeResponseEntity {
  final String? id;
  final String? nom;
  final List<String>? id_livres;
  final List<UserRequestModel>? users;

  const BibliothequeResponseModel({
    this.id,
    this.nom,
    this.id_livres,
    this.users
}): super(
    id: id,
    nom: nom,
    id_livres: id_livres,
    users: users,
  );

  factory BibliothequeResponseModel.fromJson(Map<String, dynamic> json) =>
    _$BibliothequeResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BibliothequeResponseModelToJson(this);

  factory BibliothequeResponseModel.fromEntity(BibliothequeResponseEntity entity) {
    return BibliothequeResponseModel(
      id: entity.id,
      nom: entity.nom,
      id_livres: entity.id_livres,
      users: entity.users
    );
  }
}

@JsonSerializable()
class CreateBibliothequeRequestModel extends CreateBibliothequeRequestEntity {
  final String? nom;
  final List<String>? id_livres;
  final List<UserRequestModel>? users;

  const CreateBibliothequeRequestModel({
    this.nom,
    this.id_livres,
    this.users
}): super(
    nom: nom,
    id_livres: id_livres,
    users: users,
  );

  factory CreateBibliothequeRequestModel.fromJson(Map<String, dynamic> json) =>
    _$CreateBibliothequeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBibliothequeRequestModelToJson(this);

  factory CreateBibliothequeRequestModel.fromEntity(CreateBibliothequeRequestEntity entity) {
    return CreateBibliothequeRequestModel(
      nom: entity.nom,
      id_livres: entity.id_livres,
      users: entity.users
    );
  }
}

@JsonSerializable()
class DeleteLivreRequestModel extends DeleteLivreRequestEntity {
  final List<String>? livreIds;

  const DeleteLivreRequestModel({
    this.livreIds,
}): super(
    livreIds: livreIds,
  );

  factory DeleteLivreRequestModel.fromJson(Map<String, dynamic> json) =>
    _$DeleteLivreRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteLivreRequestModelToJson(this);

  factory DeleteLivreRequestModel.fromEntity(DeleteLivreRequestEntity entity) {
    return DeleteLivreRequestModel(
      livreIds: entity.livreIds
    );
  }
}
