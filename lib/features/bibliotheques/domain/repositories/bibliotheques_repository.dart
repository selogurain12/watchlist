import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';

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
}