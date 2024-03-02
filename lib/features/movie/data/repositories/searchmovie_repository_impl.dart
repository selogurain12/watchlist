import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/movie/data/datasource/remote/searchmovie_remote_datasource.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/movie/domain/repositories/searchmovie_repository.dart';

class SearchMovieRepositoryImpl implements SearchMovieRepository {
  final SearchMovieService apiService;
  const SearchMovieRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<SearchMovieResponseModel>>> searchmovie (
      {SearchMovieRequestEntity? body}) async {
    try {
      final response = await apiService.searchmovie(
        body: SearchMovieRequestModel.fromEntity(body!),
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