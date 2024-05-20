// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsRequestModel _$StatsRequestModelFromJson(Map<String, dynamic> json) =>
    StatsRequestModel(
      tempsvu: json['tempsvu'] as int?,
      pageslu: json['pageslu'] as int?,
    );

Map<String, dynamic> _$StatsRequestModelToJson(StatsRequestModel instance) =>
    <String, dynamic>{
      'tempsvu': instance.tempsvu,
      'pageslu': instance.pageslu,
    };

StatsResponseModel _$StatsResponseModelFromJson(Map<String, dynamic> json) =>
    StatsResponseModel(
      id: json['id'] as String?,
      tempsvu: json['tempsvu'] as int?,
      pageslu: json['pageslu'] as int?,
      bibliotheque: json['bibliotheque'] as int?,
      filmEnCours: json['filmEnCours'] as int?,
      filmotheque: json['filmotheque'] as int?,
      filmsTermine: json['filmsTermine'] as int?,
      livreEnCours: json['livreEnCours'] as int?,
      livresTermine: json['livresTermine'] as int?,
    );

Map<String, dynamic> _$StatsResponseModelToJson(StatsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tempsvu': instance.tempsvu,
      'pageslu': instance.pageslu,
      'filmotheque': instance.filmotheque,
      'bibliotheque': instance.bibliotheque,
      'filmEnCours': instance.filmEnCours,
      'filmsTermine': instance.filmsTermine,
      'livreEnCours': instance.livreEnCours,
      'livresTermine': instance.livresTermine,
    };
