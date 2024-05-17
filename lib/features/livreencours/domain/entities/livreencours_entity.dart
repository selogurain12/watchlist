// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class LivreEnCoursResponseEntity extends Equatable {
  final String? id;
  final String? id_livre;
  final int? nbpageslus;

  const LivreEnCoursResponseEntity({this.id, this.id_livre, this.nbpageslus});

  @override
  List<Object?> get props => [id, id_livre, nbpageslus];

  firstWhere(bool Function(dynamic livre) param0,
      {required ApiBookResponseEntity Function() orElse}) {}
}

class CreateLivreEnCoursRequestEntity extends Equatable {
  final String? id_livre;
  final UserRequestModel? user;
  final int? nbpageslus;

  const CreateLivreEnCoursRequestEntity(
      {this.id_livre, this.user, this.nbpageslus});

  @override
  List<Object?> get props => [id_livre, user, nbpageslus];
}

class UpdateLivreEnCoursRequestEntity extends Equatable {
  final int? nbpageslus;

  const UpdateLivreEnCoursRequestEntity({this.nbpageslus});

  @override
  List<Object?> get props => [nbpageslus];
}

class AllLivreEnCoursResponseEntity extends Equatable {
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

  const AllLivreEnCoursResponseEntity({
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
    this.nbpageslus,
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
        nbpageslus
      ];
}
