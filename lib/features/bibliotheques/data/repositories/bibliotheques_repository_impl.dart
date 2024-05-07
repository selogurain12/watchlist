import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/data/datasource/remote/bibliotheques_remote_datasource.dart';
import 'package:whashlist/features/bibliotheques/data/models/bibliotheques_model.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class BibliothequesRepositoryImpl implements BibliothequesRepository {
  final BibliothequesService apiService;
  const BibliothequesRepositoryImpl(this.apiService);

  @override
  Future<DataState<BibliothequeResponseModel>> createbibliotheque(
      {CreateBibliothequeRequestEntity? body}) async {
    try {
      final response = await apiService.createbibliotheque(
        body: CreateBibliothequeRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 201) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<List<BibliothequeResponseModel>>> listbibliotheque(
      {UserRequestEntity? body}) async {
    try {
      final response = await apiService.listbibliotheque(
        body: UserRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<List<ApiBookResponseModel>>> listbook(
      {String? idbibliotheque}) async {
    try {
      final response = await apiService.listbook(
        idbibliotheque: idbibliotheque,
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<BibliothequeResponseModel>> modifiebibliotheque(
      {String? idbibliotheque, CreateBibliothequeRequestEntity? body}) async {
    try {
      final response = await apiService.modifiebibliotheque(
        idbibliotheque: idbibliotheque,
        body: CreateBibliothequeRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<BibliothequeResponseModel>> deletebook(
      {String? idbibliotheque, DeleteLivreRequestEntity? body}) async {
    try {
      final response = await apiService.deletebook(
        idbibliotheque: idbibliotheque,
        body: DeleteLivreRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<BibliothequeResponseModel>> deleteuserinbibliotheque(
      {String? idbibliotheque, UserRequestEntity? body}) async {
    try {
      final response = await apiService.deleteuserinbibliotheque(
        idbibliotheque: idbibliotheque,
        body: UserRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<void>> deletebibliotheque({String? idbibliotheque}) async {
    try {
      final response = await apiService.deletebibliotheque(
        idbibliotheque: idbibliotheque,
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }
}
