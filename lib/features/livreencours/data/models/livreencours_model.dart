// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'livreencours_model.g.dart';

@JsonSerializable()
class LivreEnCoursResponseModel extends LivreEnCoursResponseEntity {
  final String? id;
  final String? id_livre;
  final int? nbpageslus;

  const LivreEnCoursResponseModel({
    this.id,
    this.id_livre,
    this.nbpageslus,
  }) : super(
          id: id,
          id_livre: id_livre,
          nbpageslus: nbpageslus,
        );

  factory LivreEnCoursResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LivreEnCoursResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LivreEnCoursResponseModelToJson(this);

  factory LivreEnCoursResponseModel.fromEntity(
      LivreEnCoursResponseEntity entity) {
    return LivreEnCoursResponseModel(
        id: entity.id,
        id_livre: entity.id_livre,
        nbpageslus: entity.nbpageslus);
  }
}

@JsonSerializable()
class CreateLivreEnCoursRequestModel extends CreateLivreEnCoursRequestEntity {
  final String? id_livre;
  final UserRequestModel? user;
  final int? nbpageslus;

  const CreateLivreEnCoursRequestModel(
      {this.id_livre, this.user, this.nbpageslus})
      : super(
          id_livre: id_livre,
          user: user,
          nbpageslus: nbpageslus,
        );

  factory CreateLivreEnCoursRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateLivreEnCoursRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateLivreEnCoursRequestModelToJson(this);

  factory CreateLivreEnCoursRequestModel.fromEntity(
      CreateLivreEnCoursRequestEntity entity) {
    return CreateLivreEnCoursRequestModel(
        id_livre: entity.id_livre,
        user: entity.user,
        nbpageslus: entity.nbpageslus);
  }
}

@JsonSerializable()
class UpdateLivreEnCoursRequestModel extends UpdateLivreEnCoursRequestEntity {
  final int? nbpageslus;

  const UpdateLivreEnCoursRequestModel({this.nbpageslus})
      : super(
          nbpageslus: nbpageslus,
        );

  factory UpdateLivreEnCoursRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateLivreEnCoursRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateLivreEnCoursRequestModelToJson(this);

  factory UpdateLivreEnCoursRequestModel.fromEntity(
      UpdateLivreEnCoursRequestEntity entity) {
    return UpdateLivreEnCoursRequestModel(
        nbpageslus: entity.nbpageslus);
  }
}
