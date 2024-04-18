import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

abstract class BibliothequesState {
  final List<BibliothequesResponseEntity>? bibliotheques;
  final BibliothequesResponseEntity? addbibliotheque;
  final LivreBibliothequeResponseEntity? addbook;
  final List<ApiBookResponseEntity>? bibliothequebook;
  final BibliothequesResponseEntity? renamebibliotheque;
  final void deletebibliotheque;
  final void deletebookbibliotheque;
  final DioException? error;

  const BibliothequesState({
    this.error,
    this.bibliotheques,
    this.addbibliotheque,
    this.addbook,
    this.bibliothequebook,
    this.deletebibliotheque,
    this.deletebookbibliotheque,
    this.renamebibliotheque,
  });
}

class BibliothequesLoading extends BibliothequesState {
  const BibliothequesLoading();
}

class BibliothequesLoaded extends BibliothequesState {
  const BibliothequesLoaded({List<BibliothequesResponseEntity>? bibliotheques }) : super(bibliotheques: bibliotheques );
}

class LivreBibliothequeLoaded extends BibliothequesState {
  const LivreBibliothequeLoaded({LivreBibliothequeResponseEntity? addbook}) : super(addbook: addbook);
}

class AddBibliothequeLoaded extends BibliothequesState {
  const AddBibliothequeLoaded({BibliothequesResponseEntity? addbibliotheque}) : super(addbibliotheque: addbibliotheque);
}

class RenameBibliothequeLoaded extends BibliothequesState {
  const RenameBibliothequeLoaded({BibliothequesResponseEntity? renamebibliotheque})
      : super(renamebibliotheque: renamebibliotheque);
}

class ListLivreBibliothequeLoaded extends BibliothequesState {
  const ListLivreBibliothequeLoaded(
      {List<ApiBookResponseEntity>? bibliothequebook})
      : super(bibliothequebook: bibliothequebook);
}

class DeleteBibliothequeLoaded extends BibliothequesState {
  const DeleteBibliothequeLoaded() : super();
}

class DeleteBookBibliothequeLoaded extends BibliothequesState {
  const DeleteBookBibliothequeLoaded() : super();
}

class BibliothequesError extends BibliothequesState {
  const BibliothequesError(DioException? error) : super(error: error);
}

class LivreBibliothequeError extends BibliothequesState {
  const LivreBibliothequeError(DioException? error) : super(error: error);
}

class ListLivreBibliothequeError extends BibliothequesState {
  const ListLivreBibliothequeError(DioException? error) : super(error: error);
}

class RenameBibliothequeError extends BibliothequesState {
  const RenameBibliothequeError(DioException? error) : super(error: error);
}

class DeleteBibliothequeError extends BibliothequesState {
  const DeleteBibliothequeError(DioException? error) : super(error: error);
}

class DeleteBookBibliothequeError extends BibliothequesState {
  const DeleteBookBibliothequeError(DioException? error) : super(error: error);
}
