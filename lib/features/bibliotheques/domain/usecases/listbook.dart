import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

class ListLivreUseCase
    implements UseCase<DataState<List<ApiBookResponseEntity>>, String?> {
  final BibliothequesRepository repository;
  const ListLivreUseCase(this.repository);

  @override
  Future<DataState<List<ApiBookResponseEntity>>> call({String? params}) {
    return repository.listbook(idbibliotheque: params);
  }
}

