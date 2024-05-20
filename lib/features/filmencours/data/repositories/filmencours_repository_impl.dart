import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmencours/data/datasource/remote/filmencours_remote_datasource.dart';
import 'package:whashlist/features/filmencours/data/models/filmencours_model.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/filmencours/domain/repositories/filmencours_repository.dart';

class FilmEnCoursRepositoryImpl implements FilmEnCoursRepository {
  final FilmEnCoursService apiService;
  const FilmEnCoursRepositoryImpl(this.apiService);

  @override
  Future<DataState<FilmEnCoursResponseModel>> createfilmencours(
      {CreateFilmEnCoursRequestEntity? body}) async {
    try {
      final response = await apiService.createfilmencours(
        body: CreateFilmEnCoursRequestModel.fromEntity(body!),
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
  Future<DataState<List<AllFilmEnCoursResponseModel>>> listfilmencours(
      {String? id}) async {
    try {
      final response = await apiService.listfilmencours(
        id: id,
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
  Future<DataState<FilmEnCoursResponseModel>> filmencours(
      {String? id}) async {
    try {
      final response = await apiService.filmencours(
        id: id,
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
  Future<DataState<FilmEnCoursResponseModel>> updatefilmencours(
      {String? id, UpdateFilmEnCoursRequestEntity? body}) async {
    try {
      final response = await apiService.updatefilmencours(
        id: id,
        body: UpdateFilmEnCoursRequestModel.fromEntity(body!),
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
  Future<DataState<void>> deletefilmencours({String? id}) async {
    try {
      final response = await apiService.deletefilmencours(
        id: id,
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
