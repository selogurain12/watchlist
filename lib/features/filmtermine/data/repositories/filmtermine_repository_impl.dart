import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmtermine/data/datasource/remote/filmtermine_remote_datasource.dart';
import 'package:whashlist/features/filmtermine/data/models/filmtermine_model.dart';
import 'package:whashlist/features/filmtermine/domain/entities/filmtermine_entity.dart';
import 'package:whashlist/features/filmtermine/domain/repositories/filmtermine_repository.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';

class FilmTermineRepositoryImpl implements FilmTermineRepository {
  final FilmtermineService apiService;
  const FilmTermineRepositoryImpl(this.apiService);

  @override
  Future<DataState<FilmTermineResponseModel>> createfilmtermine(
      {CreateFilmTermineRequestEntity? body}) async {
    try {
      final response = await apiService.createfilmtermine(
        body: CreateFilmTermineRequestModel.fromEntity(body!),
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
  Future<DataState<List<SearchMovieResponseModel>>> listfilmtermine(
      {String? id}) async {
    try {
      final response = await apiService.listfilmtermine(
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
  Future<DataState<void>> deletefilmtermine({String? id}) async {
    try {
      final response = await apiService.deletefilmtermine(
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
