// ignore_for_file: overridden_fields, annotate_overrides, non_constant_identifier_names


import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stats_model.g.dart';

@JsonSerializable()
class StatsRequestModel extends StatsRequestEntity {
  final int? tempsvu;
  final int? pageslu;

  const StatsRequestModel({
    this.tempsvu,
    this.pageslu
}): super(
    tempsvu: tempsvu,
    pageslu: pageslu,
  );

  factory StatsRequestModel.fromJson(Map<String, dynamic> json) =>
    _$StatsRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatsRequestModelToJson(this);

  factory StatsRequestModel.fromEntity(StatsRequestEntity entity) {
    return StatsRequestModel(
      tempsvu: entity.tempsvu,
      pageslu: entity.pageslu,
    );
  }
}

@JsonSerializable()
class StatsResponseModel extends StatsResponseEntity {
  final String? id;
  final int? tempsvu;
  final int? pageslu;
  final int? filmotheque;
  final int? bibliotheque;
  final int? filmEnCours;
  final int? filmsTermine;
  final int? livreEnCours;
  final int? livresTermine;

  const StatsResponseModel({
    this.id,
    this.tempsvu,
    this.pageslu,
    this.bibliotheque,
    this.filmEnCours,
    this.filmotheque,
    this.filmsTermine,
    this.livreEnCours,
    this.livresTermine
}): super(
    id: id,
    tempsvu: tempsvu,
    pageslu: pageslu,
    bibliotheque: bibliotheque,
    filmEnCours: filmEnCours,
    filmotheque: filmotheque,
    filmsTermine: filmsTermine,
    livreEnCours: livreEnCours,
    livresTermine: livresTermine
  );

  factory StatsResponseModel.fromJson(Map<String, dynamic> json) =>
    _$StatsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatsResponseModelToJson(this);

  factory StatsResponseModel.fromEntity(StatsResponseEntity entity) {
    return StatsResponseModel(
      id: entity.id,
      tempsvu: entity.tempsvu,
      pageslu: entity.pageslu,
      bibliotheque: entity.bibliotheque,
      filmEnCours: entity.filmEnCours,
      filmotheque: entity.filmotheque,
      filmsTermine: entity.filmsTermine,
      livreEnCours: entity.livreEnCours,
      livresTermine: entity.livresTermine
    );
  }
}
