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

AllLivreEnCoursResponseModel _$AllLivreEnCoursResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllLivreEnCoursResponseModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      publisher: json['publisher'] as String?,
      imageLink: json['imageLink'] as String?,
      publisherDate: json['publisherDate'] as String?,
      description: json['description'] as String?,
      industryIdentifierstype: json['industryIdentifierstype'] as String?,
      industryIdentifieridentyfier:
          json['industryIdentifieridentyfier'] as String?,
      pageCount: json['pageCount'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      retailPriceamount: (json['retailPriceamount'] as num?)?.toDouble(),
      retailPricecurrencyCode: json['retailPricecurrencyCode'] as String?,
      retailPricebuyLink: json['retailPricebuyLink'] as String?,
      nbpageslus: json['nbpageslus'] as int?,
    );

Map<String, dynamic> _$AllLivreEnCoursResponseModelToJson(
        AllLivreEnCoursResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'imageLink': instance.imageLink,
      'publisherDate': instance.publisherDate,
      'description': instance.description,
      'industryIdentifierstype': instance.industryIdentifierstype,
      'industryIdentifieridentyfier': instance.industryIdentifieridentyfier,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'retailPriceamount': instance.retailPriceamount,
      'retailPricecurrencyCode': instance.retailPricecurrencyCode,
      'retailPricebuyLink': instance.retailPricebuyLink,
      'nbpageslus': instance.nbpageslus,
    };
