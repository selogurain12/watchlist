import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/data/datasource/remote/filmotheques_remote_datasource.dart';
import 'package:whashlist/features/filmotheques/data/models/filmotheques_model.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';

class FilmothequesRepositoryImpl implements FilmothequesRepository {
  final FilmothequesService apiService;
  const FilmothequesRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<FilmothequesResponseModel>>> filmotheques(
      {FilmothequesRequestEntity? body}) async {
    try {
      final response = await apiService.filmotheques(
        body: FilmothequesRequestModel.fromEntity(body!),
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
  Future<DataState<FilmothequesResponseModel>> addfilmotheque(
      {AddFilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.addfilmotheque(
        body: AddFilmothequeRequestModel.fromEntity(body!),
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
  Future<DataState<FilmFilmothequeResponseModel>> addmovie(
      {FilmFilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.addmovie(
        body: FilmFilmothequeRequestModel.fromEntity(body!),
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
  Future<DataState<List<SearchMovieResponseModel>>> filmothequemovie(
      {ListFilmFilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.filmothequemovie(
        body: ListFilmFilmothequeRequestModel.fromEntity(body!),
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
  Future<DataState<FilmothequesResponseModel>> renamefilmotheque(
      {FilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.renamefilmotheque(
        body: FilmothequeRequestModel.fromEntity(body!),
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
  Future<DataState<void>> deletefilmotheque(
      {ListFilmFilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.deletefilmotheque(
        body: ListFilmFilmothequeRequestModel.fromEntity(body!),
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
  Future<DataState<void>> deletemoviefilmotheque(
      {FilmFilmothequeRequestEntity? body}) async {
    try {
      final response = await apiService.deletemoviefilmotheque(
        body: FilmFilmothequeRequestModel.fromEntity(body!),
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
