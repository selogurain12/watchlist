
import 'package:equatable/equatable.dart';

class ApiBookRequestEntity extends Equatable {
  final String? q;

  const ApiBookRequestEntity({
    this.q,
  });

  @override
  List<Object?> get props => [
    q,
  ];
}

class ApiBookResponseEntity extends Equatable {
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


  const ApiBookResponseEntity({
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
  });

  @override
  List<Object?> get props => [
    id,
    title,
    authors,
    publisher,
    imageLink,
    publisherDate,
    description,
    industryIdentifierstype,
    industryIdentifieridentyfier,
    pageCount,
    categories,
    retailPriceamount,
    retailPricecurrencyCode,
    retailPricebuyLink,
  ];
}