import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

class ListLivreBibliothequeUseCase
    implements
        UseCase<DataState<List<ApiBookResponseEntity>>,
            ListLivreBibliothequeRequestEntity> {
  final BibliothequesRepository repository;
  const ListLivreBibliothequeUseCase(this.repository);

  @override
  Future<DataState<List<ApiBookResponseEntity>>> call(
      {ListLivreBibliothequeRequestEntity? params}) {
    return repository.bibliothequebook(
      body: params,
    );
  }
}
