import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';

abstract class BibliothequesState {
  final List<BibliothequesResponseEntity>? bibliotheques;
  final BibliothequesResponseEntity? addbibliotheque;
  final LivreBibliothequeResponseEntity? addbook;
  final DioException? error;

  const BibliothequesState({
    this.error,
    this.bibliotheques,
    this.addbibliotheque,
    this.addbook,
  });
}

class BibliothequesLoading extends BibliothequesState {
  const BibliothequesLoading();
}

class BibliothequesLoaded extends BibliothequesState {
  const BibliothequesLoaded({List<BibliothequesResponseEntity>? bibliotheques, BibliothequesResponseEntity? addbibliotheque, LivreBibliothequeResponseEntity? addbook}) : super(bibliotheques: bibliotheques, addbibliotheque: addbibliotheque, addbook: addbook);
}

class BibliothequesError extends BibliothequesState {
  const BibliothequesError(DioException? error) : super(error: error);
}

class LivreBibliothequeError extends BibliothequesState {
  const LivreBibliothequeError(DioException? error) : super(error: error);
}