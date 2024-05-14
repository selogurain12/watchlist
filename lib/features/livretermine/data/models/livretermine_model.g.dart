// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livretermine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivreTermineResponseModel _$LivreTermineResponseModelFromJson(
        Map<String, dynamic> json) =>
    LivreTermineResponseModel(
      id: json['id'] as String?,
      id_livre: json['id_livre'] as String?,
      user: json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LivreTermineResponseModelToJson(
        LivreTermineResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_livre': instance.id_livre,
      'user': instance.user,
    };

CreateLivreTermineRequestModel _$CreateLivreTermineRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateLivreTermineRequestModel(
      id_livre: json['id_livre'] as String?,
      user: json['user'] == null
          ? null
          : UserRequestModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateLivreTermineRequestModelToJson(
        CreateLivreTermineRequestModel instance) =>
    <String, dynamic>{
      'id_livre': instance.id_livre,
      'user': instance.user,
    };
