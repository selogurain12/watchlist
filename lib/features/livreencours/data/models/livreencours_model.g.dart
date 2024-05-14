// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livreencours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivreEnCoursResponseModel _$LivreEnCoursResponseModelFromJson(
        Map<String, dynamic> json) =>
    LivreEnCoursResponseModel(
      id: json['id'] as String?,
      id_livre: json['id_livre'] as String?,
      nbpageslus: json['nbpageslus'] as int?,
    );

Map<String, dynamic> _$LivreEnCoursResponseModelToJson(
        LivreEnCoursResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_livre': instance.id_livre,
      'nbpageslus': instance.nbpageslus,
    };

CreateLivreEnCoursRequestModel _$CreateLivreEnCoursRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateLivreEnCoursRequestModel(
      id_livre: json['id_livre'] as String?,
      user: json['user'] == null
          ? null
          : UserRequestModel.fromJson(json['user'] as Map<String, dynamic>),
      nbpageslus: json['nbpageslus'] as int?,
    );

Map<String, dynamic> _$CreateLivreEnCoursRequestModelToJson(
        CreateLivreEnCoursRequestModel instance) =>
    <String, dynamic>{
      'id_livre': instance.id_livre,
      'user': instance.user,
      'nbpageslus': instance.nbpageslus,
    };

UpdateLivreEnCoursRequestModel _$UpdateLivreEnCoursRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateLivreEnCoursRequestModel(
      nbpageslus: json['nbpageslus'] as int?,
    );

Map<String, dynamic> _$UpdateLivreEnCoursRequestModelToJson(
        UpdateLivreEnCoursRequestModel instance) =>
    <String, dynamic>{
      'nbpageslus': instance.nbpageslus,
    };
