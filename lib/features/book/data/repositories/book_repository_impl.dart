import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/book/data/datasource/remote/book_remote_datasource.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/book/domain/repositories/book_repository.dart';

class ApiBookRepositoryImpl implements ApiBookRepository {
  final BookApiService apiService;
  const ApiBookRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<ApiBookResponseModel>>> searchbook (
      {ApiBookRequestEntity? body}) async {
    try {
      final response = await apiService.searchbook(
        body: ApiBookRequestModel.fromEntity(body!),
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