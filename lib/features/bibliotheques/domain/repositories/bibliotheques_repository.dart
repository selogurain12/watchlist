import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class BibliothequesRepository {
  Future<DataState<BibliothequeResponseEntity>> createbibliotheque({
    CreateBibliothequeRequestEntity? body,
  });

  Future<DataState<List<BibliothequeResponseEntity>>> listbibliotheque({
    UserRequestEntity? body,
  });

  Future<DataState<List<ApiBookResponseEntity>>> listbook({
    String? idbibliotheque,
  });

  Future<DataState<BibliothequeResponseEntity>> modifiebibliotheque({
    String? idbibliotheque,
    CreateBibliothequeRequestEntity? body
  });

  Future<DataState<BibliothequeResponseEntity>> deletebook({
    String? idbibliotheque,
    DeleteLivreRequestEntity? body
  });

  Future<DataState<BibliothequeResponseEntity>> deleteuserinbibliotheque({
    String? idbibliotheque,
    UserRequestEntity? body
  });

  Future<DataState<void>> deletebibliotheque({
    String? idbibliotheque,
  });
}