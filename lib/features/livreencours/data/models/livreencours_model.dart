// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'livreencours_model.g.dart';

@JsonSerializable()
class LivreEnCoursResponseModel extends LivreEnCoursResponseEntity {
  final String? id;
  final String? id_livre;
  final int? nbpageslus;

  const LivreEnCoursResponseModel({
    this.id,
    this.id_livre,
    this.nbpageslus,
  }) : super(
          id: id,
          id_livre: id_livre,
          nbpageslus: nbpageslus,
        );

  factory LivreEnCoursResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LivreEnCoursResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LivreEnCoursResponseModelToJson(this);

  factory LivreEnCoursResponseModel.fromEntity(
      LivreEnCoursResponseEntity entity) {
    return LivreEnCoursResponseModel(
        id: entity.id,
        id_livre: entity.id_livre,
        nbpageslus: entity.nbpageslus);
  }
}

@JsonSerializable()
class CreateLivreEnCoursRequestModel extends CreateLivreEnCoursRequestEntity {
  final String? id_livre;
  final UserRequestModel? user;
  final int? nbpageslus;

  const CreateLivreEnCoursRequestModel(
      {this.id_livre, this.user, this.nbpageslus})
      : super(
          id_livre: id_livre,
          user: user,
          nbpageslus: nbpageslus,
        );

  factory CreateLivreEnCoursRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateLivreEnCoursRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateLivreEnCoursRequestModelToJson(this);

  factory CreateLivreEnCoursRequestModel.fromEntity(
      CreateLivreEnCoursRequestEntity entity) {
    return CreateLivreEnCoursRequestModel(
        id_livre: entity.id_livre,
        user: entity.user,
        nbpageslus: entity.nbpageslus);
  }
}

@JsonSerializable()
class UpdateLivreEnCoursRequestModel extends UpdateLivreEnCoursRequestEntity {
  final int? nbpageslus;

  const UpdateLivreEnCoursRequestModel({this.nbpageslus})
      : super(
          nbpageslus: nbpageslus,
        );

  factory UpdateLivreEnCoursRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateLivreEnCoursRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateLivreEnCoursRequestModelToJson(this);

  factory UpdateLivreEnCoursRequestModel.fromEntity(
      UpdateLivreEnCoursRequestEntity entity) {
    return UpdateLivreEnCoursRequestModel(
        nbpageslus: entity.nbpageslus);
  }
}

@JsonSerializable()
class AllLivreEnCoursResponseModel extends AllLivreEnCoursResponseEntity {
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
  final int? nbpageslus;

  const AllLivreEnCoursResponseModel({
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
    this.nbpageslus
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
    retailPricebuyLink: retailPricebuyLink,
    nbpageslus: nbpageslus
  );

  factory AllLivreEnCoursResponseModel.fromJson(Map<String, dynamic> json) =>
    _$AllLivreEnCoursResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllLivreEnCoursResponseModelToJson(this);

  factory AllLivreEnCoursResponseModel.fromEntity(AllLivreEnCoursResponseEntity entity) {
    return AllLivreEnCoursResponseModel(
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
      nbpageslus: entity.nbpageslus
    );
  }
}
