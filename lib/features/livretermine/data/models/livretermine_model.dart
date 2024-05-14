// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/livretermine/domain/entities/livretermine_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'livretermine_model.g.dart';

@JsonSerializable()
class LivreTermineResponseModel extends LivreTermineResponseEntity {
  final String? id;
  final String? id_livre;
  final UserResponseModel? user;

  const LivreTermineResponseModel({
    this.id,
    this.id_livre,
    this.user,
}): super(
    id: id,
    id_livre: id_livre,
    user: user,
  );

  factory LivreTermineResponseModel.fromJson(Map<String, dynamic> json) =>
    _$LivreTermineResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LivreTermineResponseModelToJson(this);

  factory LivreTermineResponseModel.fromEntity(LivreTermineResponseEntity entity) {
    return LivreTermineResponseModel(
      id: entity.id,
      id_livre: entity.id_livre,
      user: entity.user
    );
  }
}

@JsonSerializable()
class CreateLivreTermineRequestModel extends CreateLivreTermineRequestEntity {
  final String? id_livre;
  final UserRequestModel? user;

  const CreateLivreTermineRequestModel({
    this.id_livre,
    this.user
}): super(
    id_livre: id_livre,
    user: user,
  );

  factory CreateLivreTermineRequestModel.fromJson(Map<String, dynamic> json) =>
    _$CreateLivreTermineRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateLivreTermineRequestModelToJson(this);

  factory CreateLivreTermineRequestModel.fromEntity(CreateLivreTermineRequestEntity entity) {
    return CreateLivreTermineRequestModel(
      id_livre: entity.id_livre,
      user: entity.user
    );
  }
}
