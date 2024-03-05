// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bibliotheques_model.g.dart';

@JsonSerializable()
class BibliothequesRequestModel extends BibliothequesRequestEntity {
  final String? id;

  const BibliothequesRequestModel({
    this.id,
}): super(
    id: id,
  );

  factory BibliothequesRequestModel.fromJson(Map<String, dynamic> json) =>
    _$BibliothequesRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$BibliothequesRequestModelToJson(this);

  factory BibliothequesRequestModel.fromEntity(BibliothequesRequestEntity entity) {
    return BibliothequesRequestModel(
      id: entity.id,
    );
  }
}

@JsonSerializable()
class BibliothequesResponseModel extends BibliothequesResponseEntity {
  final String? id;
  final String? nom;
  final String? id_user;

  const BibliothequesResponseModel({
    this.id,
    this.nom,
    this.id_user
}): super(
    id: id,
    nom: nom,
    id_user: id_user
  );

  factory BibliothequesResponseModel.fromJson(Map<String, dynamic> json) =>
    _$BibliothequesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BibliothequesResponseModelToJson(this);

  factory BibliothequesResponseModel.fromEntity(BibliothequesResponseEntity entity) {
    return BibliothequesResponseModel(
      id: entity.id,
      nom: entity.nom,
      id_user: entity.id_user,
    );
  }
}

@JsonSerializable()
class AddBibliothequeRequestModel extends AddBibliothequeRequestEntity {
  final String? id_user;
  final String? nom;

  const AddBibliothequeRequestModel({
    this.nom,
    this.id_user,
}): super(
    nom: nom,
    id_user: id_user,
  );

  factory AddBibliothequeRequestModel.fromJson(Map<String, dynamic> json) =>
    _$AddBibliothequeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddBibliothequeRequestModelToJson(this);

  factory AddBibliothequeRequestModel.fromEntity(AddBibliothequeRequestEntity entity) {
    return AddBibliothequeRequestModel(
      nom: entity.nom,
      id_user: entity.id_user,
    );
  }
}

@JsonSerializable()
class LivreBibliothequeRequestModel extends LivreBibliothequeRequestEntity {
  final String? id_livre;
  final String? id_bibliotheque;

  const LivreBibliothequeRequestModel({
    this.id_livre,
    this.id_bibliotheque,
}): super(
    id_livre: id_livre,
    id_bibliotheque: id_bibliotheque,
  );

  factory LivreBibliothequeRequestModel.fromJson(Map<String, dynamic> json) =>
    _$LivreBibliothequeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$LivreBibliothequeRequestModelToJson(this);

  factory LivreBibliothequeRequestModel.fromEntity(LivreBibliothequeRequestEntity entity) {
    return LivreBibliothequeRequestModel(
      id_livre: entity.id_livre,
      id_bibliotheque: entity.id_bibliotheque,
    );
  }
}

@JsonSerializable()
class LivreBibliothequeResponseModel extends LivreBibliothequeResponseEntity {
  final String? id;
  final String? id_livre;
  final String? id_bibliotheque;

  const LivreBibliothequeResponseModel({
    this.id,
    this.id_livre,
    this.id_bibliotheque
}): super(
    id: id,
    id_livre: id_livre,
    id_bibliotheque: id_bibliotheque
  );

  factory LivreBibliothequeResponseModel.fromJson(Map<String, dynamic> json) =>
    _$LivreBibliothequeResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LivreBibliothequeResponseModelToJson(this);

  factory LivreBibliothequeResponseModel.fromEntity(LivreBibliothequeResponseEntity entity) {
    return LivreBibliothequeResponseModel(
      id: entity.id,
      id_livre: entity.id_livre,
      id_bibliotheque: entity.id_bibliotheque,
    );
  }
}