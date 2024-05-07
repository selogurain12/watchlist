import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

abstract class BibliothequeState {
  final BibliothequeResponseEntity? createbibliotheque;
  final List<BibliothequeResponseEntity>? listbibliotheque;
  final List<ApiBookResponseEntity>? listbook;
  final BibliothequeResponseEntity? modifiebibliotheque;
  final BibliothequeResponseEntity? deletebook;
  final BibliothequeResponseEntity? deleteuserinbibliotheque;
  final void deletebibliotheque;
  final DioException? error;

  const BibliothequeState({
    this.error,
    this.createbibliotheque,
    this.listbibliotheque,
    this.listbook,
    this.modifiebibliotheque,
    this.deletebibliotheque,
    this.deletebook,
    this.deleteuserinbibliotheque,
  });
}

class BibliothequesLoading extends BibliothequeState {
  const BibliothequesLoading();
}

class DeleteBookLoaded extends BibliothequeState {
  const DeleteBookLoaded({BibliothequeResponseEntity? deletebook }) : super(deletebook: deletebook );
}

class CreateBibliothequeLoaded extends BibliothequeState {
  const CreateBibliothequeLoaded({BibliothequeResponseEntity? createbibliotheque}) : super(createbibliotheque: createbibliotheque);
}

class DeleteUserinBibliothequeLoaded extends BibliothequeState {
  const DeleteUserinBibliothequeLoaded({BibliothequeResponseEntity? deleteuserinbibliotheque}) : super(deleteuserinbibliotheque: deleteuserinbibliotheque);
}

class DeleteBibliothequeLoaded extends BibliothequeState {
  const DeleteBibliothequeLoaded() : super();
}

class ListBibliothequeLoaded extends BibliothequeState {
  const ListBibliothequeLoaded(
      {List<BibliothequeResponseEntity>? listbibliotheque})
      : super(listbibliotheque: listbibliotheque);
}

class ListLivreLoaded extends BibliothequeState {
  const ListLivreLoaded({List<ApiBookResponseEntity>? listbook}) : super(listbook: listbook);
}

class ModifieBibliothequeLoaded extends BibliothequeState {
  const ModifieBibliothequeLoaded({BibliothequeResponseEntity? modifiebibliotheque}) : super(modifiebibliotheque: modifiebibliotheque);
}

class BibliothequesError extends BibliothequeState {
  const BibliothequesError(DioException? error) : super(error: error);
}

class DeleteBookError extends BibliothequeState {
  const DeleteBookError(DioException? error) : super(error: error);
}

class CreateBibliothequeError extends BibliothequeState {
  const CreateBibliothequeError(DioException? error) : super(error: error);
}

class DeleteUserinBibliothequeError extends BibliothequeState {
  const DeleteUserinBibliothequeError(DioException? error) : super(error: error);
}

class DeleteBibliothequeError extends BibliothequeState {
  const DeleteBibliothequeError(DioException? error) : super(error: error);
}

class ListBibliothequeError extends BibliothequeState {
  const ListBibliothequeError(DioException? error) : super(error: error);
}

class ListLivreError extends BibliothequeState {
  const ListLivreError(DioException? error) : super(error: error);
}

class ModifieBibliothequeError extends BibliothequeState {
  const ModifieBibliothequeError(DioException? error) : super(error: error);
}
