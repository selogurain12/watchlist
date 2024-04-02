// ignore_for_file: overridden_fields, annotate_overrides, non_constant_identifier_names


import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stats_model.g.dart';

@JsonSerializable()
class UpdateStatsRequestModel extends UpdateStatsRequestEntity {
  final String? iduser;
  final int? filmsvu;
  final int? tempsvu;
  final int? livreslu;
  final int? pageslu;

  const UpdateStatsRequestModel({
    this.iduser,
    this.filmsvu,
    this.tempsvu,
    this.livreslu,
    this.pageslu
}): super(
    iduser: iduser,
    filmsvu: filmsvu,
    tempsvu: tempsvu,
    livreslu: livreslu,
    pageslu: pageslu,
  );

  factory UpdateStatsRequestModel.fromJson(Map<String, dynamic> json) =>
    _$UpdateStatsRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateStatsRequestModelToJson(this);

  factory UpdateStatsRequestModel.fromEntity(UpdateStatsRequestEntity entity) {
    return UpdateStatsRequestModel(
      iduser: entity.iduser,
      filmsvu: entity.filmsvu,
      tempsvu: entity.tempsvu,
      livreslu: entity.livreslu,
      pageslu: entity.pageslu,
    );
  }
}

@JsonSerializable()
class UpdateStatsResponseModel extends UpdateStatsResponseEntity {
  final String? iduser;
  final int? filmsvu;
  final int? tempsvu;
  final int? livreslu;
  final int? pageslu;

  const UpdateStatsResponseModel({
    this.iduser,
    this.filmsvu,
    this.tempsvu,
    this.livreslu,
    this.pageslu,
}): super(
    iduser: iduser,
    filmsvu: filmsvu,
    tempsvu: tempsvu,
    livreslu: livreslu,
    pageslu: pageslu,
  );

  factory UpdateStatsResponseModel.fromJson(Map<String, dynamic> json) =>
    _$UpdateStatsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateStatsResponseModelToJson(this);

  factory UpdateStatsResponseModel.fromEntity(UpdateStatsResponseEntity entity) {
    return UpdateStatsResponseModel(
      iduser: entity.iduser,
      filmsvu: entity.filmsvu,
      tempsvu: entity.tempsvu,
      livreslu: entity.livreslu,
      pageslu: entity.pageslu,
    );
  }
}

@JsonSerializable()
class StatsRequestModel extends StatsRequestEntity {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? username;

  const StatsRequestModel({
    this.id,
    this.nom,
    this.prenom,
    this.username,
}): super(
    id: id,
    nom: nom,
    prenom: prenom,
    username: username,
  );

  factory StatsRequestModel.fromJson(Map<String, dynamic> json) =>
    _$StatsRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatsRequestModelToJson(this);

  factory StatsRequestModel.fromEntity(StatsRequestEntity entity) {
    return StatsRequestModel(
      id: entity.id,
      nom: entity.nom,
      prenom: entity.prenom,
      username: entity.username,
    );
  }
}

@JsonSerializable()
class StatsResponseModel extends StatsResponseEntity {
  final String? iduser;
  final int? filmsvu;
  final int? tempsvu;
  final int? livreslu;
  final int? pageslu;

  const StatsResponseModel({
    this.iduser,
    this.filmsvu,
    this.tempsvu,
    this.livreslu,
    this.pageslu,
}): super(
    iduser: iduser,
    filmsvu: filmsvu,
    tempsvu: tempsvu,
    livreslu: livreslu,
    pageslu: pageslu,
  );

  factory StatsResponseModel.fromJson(Map<String, dynamic> json) =>
    _$StatsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatsResponseModelToJson(this);

  factory StatsResponseModel.fromEntity(StatsResponseEntity entity) {
    return StatsResponseModel(
      iduser: entity.iduser,
      filmsvu: entity.filmsvu,
      tempsvu: entity.tempsvu,
      livreslu: entity.livreslu,
      pageslu: entity.pageslu,
    );
  }
}
