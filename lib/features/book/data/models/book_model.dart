// ignore_for_file: overridden_fields, annotate_overrides


import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class ApiBookRequestModel extends ApiBookRequestEntity {
  final String? q;

  const ApiBookRequestModel({
    this.q,
}): super(
    q: q,
  );

  factory ApiBookRequestModel.fromJson(Map<String, dynamic> json) =>
    _$ApiBookRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiBookRequestModelToJson(this);

  factory ApiBookRequestModel.fromEntity(ApiBookRequestEntity entity) {
    return ApiBookRequestModel(
      q: entity.q,
    );
  }
}

@JsonSerializable()
class ApiBookResponseModel extends ApiBookResponseEntity {
  final String? id;
  final String? title;
  final List<String?>? authors;
  final String? publisher;
  final String? imageLink;
  final String? publisherDate;
  final String? description;
  final String? industryIdentifierstype;
  final String? industryIdentifieridentyfier;
  final int? pageCount;
  final List<String?>? categories;
  final double? retailPriceamount;
  final String? retailPricecurrencyCode;
  final String? retailPricebuyLink;

  const ApiBookResponseModel({
    this.id,
    this.title,
    this.authors,
    this.publisher,
    this.imageLink,
    this.publisherDate,
    this.description,
    this.industryIdentifierstype,
    this.industryIdentifieridentyfier,
    this.pageCount,
    this.categories,
    this.retailPriceamount,
    this.retailPricecurrencyCode,
    this.retailPricebuyLink,
}): super(
    id: id,
    title: title,
    authors: authors,
    publisher: publisher,
    imageLink: imageLink,
    publisherDate: publisherDate,
    description: description,
    industryIdentifierstype: industryIdentifierstype,
    industryIdentifieridentyfier: industryIdentifieridentyfier,
    pageCount: pageCount,
    categories: categories,
    retailPriceamount: retailPriceamount,
    retailPricecurrencyCode: retailPricecurrencyCode,
    retailPricebuyLink: retailPricebuyLink
  );

  factory ApiBookResponseModel.fromJson(Map<String, dynamic> json) =>
    _$ApiBookResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiBookResponseModelToJson(this);

  factory ApiBookResponseModel.fromEntity(ApiBookResponseEntity entity) {
    return ApiBookResponseModel(
      id: entity.id,
      title: entity.title,
      authors: entity.authors,
      publisher: entity.publisher,
      imageLink: entity.imageLink,
      publisherDate: entity.publisherDate,
      description: entity.description,
      industryIdentifierstype: entity.industryIdentifierstype,
      industryIdentifieridentyfier: entity.industryIdentifieridentyfier,
      pageCount: entity.pageCount,
      categories: entity.categories,
      retailPriceamount: entity.retailPriceamount,
      retailPricecurrencyCode: entity.retailPricecurrencyCode,
      retailPricebuyLink: entity.retailPricebuyLink,
    );
  }
}
