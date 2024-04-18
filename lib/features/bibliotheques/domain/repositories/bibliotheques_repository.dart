import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

abstract class BibliothequesRepository {
  Future<DataState<List<BibliothequesResponseEntity>>> bibliotheques({
    BibliothequesRequestEntity? body,
  });

  Future<DataState<BibliothequesResponseEntity>> addbibliotheque({
    AddBibliothequeRequestEntity? body,
  });

  Future<DataState<LivreBibliothequeResponseEntity>> addbook({
    LivreBibliothequeRequestEntity? body,
  });

  Future<DataState<List<ApiBookResponseEntity>>>
      bibliothequebook({
    ListLivreBibliothequeRequestEntity? body,
  });

  Future<DataState<BibliothequesResponseEntity>>
      renamebibliotheque({
    BibliothequeRequestEntity? body,
  });

  Future<DataState<void>>
      deletebibliotheque({
    ListLivreBibliothequeRequestEntity? body,
  });

  Future<DataState<void>>
      deletebookbibliotheque({
    LivreBibliothequeRequestEntity? body,
  });
}