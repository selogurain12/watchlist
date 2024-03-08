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
