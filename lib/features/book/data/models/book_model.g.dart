// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBookRequestModel _$ApiBookRequestModelFromJson(Map<String, dynamic> json) =>
    ApiBookRequestModel(
      q: json['q'] as String?,
    );

Map<String, dynamic> _$ApiBookRequestModelToJson(
        ApiBookRequestModel instance) =>
    <String, dynamic>{
      'q': instance.q,
    };

ApiBookResponseModel _$ApiBookResponseModelFromJson(
        Map<String, dynamic> json) =>
    ApiBookResponseModel(
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
    );

Map<String, dynamic> _$ApiBookResponseModelToJson(
        ApiBookResponseModel instance) =>
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
    };
