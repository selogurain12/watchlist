import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/data/datasource/remote/filmotheques_remote_datasource.dart';
import 'package:whashlist/features/filmotheques/data/models/filmotheques_model.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class FilmothequesRepositoryImpl implements FilmothequesRepository {
  final FilmothequesService apiService;
  const FilmothequesRepositoryImpl(this.apiService);

  @override
  Future<DataState<FilmothequeResponseModel>> createfilmotheque(
      {CreateFilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.createfilmotheque(
        body: CreateFilmothequeRequestModel.fromEntity(body!),
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
  Future<DataState<List<FilmothequeResponseModel>>> listfilmotheque(
      {UserRequestEntity? body}) async {
    try {
      final response = await apiService.listfilmotheque(
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
  Future<DataState<List<SearchMovieResponseModel>>> listmovie(
      {String? idfilmotheque}) async {
    try {
      final response = await apiService.listmovie(
        idfilmotheque: idfilmotheque,
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
  Future<DataState<FilmothequeResponseModel>> modifiefilmotheque(
      {String? idfilmotheque, CreateFilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.modifiefilmotheque(
        idfilmotheque: idfilmotheque,
        body: CreateFilmothequeRequestModel.fromEntity(body!),
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
  Future<DataState<FilmothequeResponseModel>> deletemovie(
      {String? idfilmotheque, DeleteFilmRequestEntity? body}) async {
    try {
      final response = await apiService.deletemovie(
        idfilmotheque: idfilmotheque,
        body: DeleteFilmRequestModel.fromEntity(body!),
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
  Future<DataState<FilmothequeResponseModel>> deleteuserinfilmotheque(
      {String? idfilmotheque, UserRequestEntity? body}) async {
    try {
      final response = await apiService.deleteuserinfilmotheque(
        idfilmotheque: idfilmotheque,
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
  Future<DataState<void>> deletefilmotheque({String? idfilmotheque}) async {
    try {
      final response = await apiService.deletefilmotheque(
        idfilmotheque: idfilmotheque,
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