import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/movie/data/datasource/remote/movie_remote_datasource.dart';
import 'package:whashlist/features/movie/data/models/movie_model.dart';
import 'package:whashlist/features/movie/domain/entities/movie_entity.dart';
import 'package:whashlist/features/movie/domain/repositories/movie_repository.dart';

class ApiMovieRepositoryImpl implements ApiMovieRepository {
  final MovieApiService apiService;
  const ApiMovieRepositoryImpl(this.apiService);

  @override
  Future<DataState<ApiMovieResponseModel>> searchmovie (
      {ApiMovieRequestEntity? body}) async {
    try {
      final response = await apiService.searchmovie(
        body: ApiMovieRequestModel.fromEntity(body!),
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
}