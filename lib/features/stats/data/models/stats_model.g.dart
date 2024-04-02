// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatsRequestModel _$UpdateStatsRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateStatsRequestModel(
      iduser: json['iduser'] as String?,
      filmsvu: json['filmsvu'] as int?,
      tempsvu: json['tempsvu'] as int?,
      livreslu: json['livreslu'] as int?,
      pageslu: json['pageslu'] as int?,
    );

Map<String, dynamic> _$UpdateStatsRequestModelToJson(
        UpdateStatsRequestModel instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'filmsvu': instance.filmsvu,
      'tempsvu': instance.tempsvu,
      'livreslu': instance.livreslu,
      'pageslu': instance.pageslu,
    };

UpdateStatsResponseModel _$UpdateStatsResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateStatsResponseModel(
      iduser: json['iduser'] as String?,
      filmsvu: json['filmsvu'] as int?,
      tempsvu: json['tempsvu'] as int?,
      livreslu: json['livreslu'] as int?,
      pageslu: json['pageslu'] as int?,
    );

Map<String, dynamic> _$UpdateStatsResponseModelToJson(
        UpdateStatsResponseModel instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'filmsvu': instance.filmsvu,
      'tempsvu': instance.tempsvu,
      'livreslu': instance.livreslu,
      'pageslu': instance.pageslu,
    };

StatsRequestModel _$StatsRequestModelFromJson(Map<String, dynamic> json) =>
    StatsRequestModel(
      id: json['id'] as String?,
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$StatsRequestModelToJson(StatsRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'username': instance.username,
    };

StatsResponseModel _$StatsResponseModelFromJson(Map<String, dynamic> json) =>
    StatsResponseModel(
      iduser: json['iduser'] as String?,
      filmsvu: json['filmsvu'] as int?,
      tempsvu: json['tempsvu'] as int?,
      livreslu: json['livreslu'] as int?,
      pageslu: json['pageslu'] as int?,
    );

Map<String, dynamic> _$StatsResponseModelToJson(StatsResponseModel instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'filmsvu': instance.filmsvu,
      'tempsvu': instance.tempsvu,
      'livreslu': instance.livreslu,
      'pageslu': instance.pageslu,
    };
