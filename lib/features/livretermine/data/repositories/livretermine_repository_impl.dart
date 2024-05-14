import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';
import 'package:whashlist/features/livretermine/data/datasource/remote/livretermine_remote_datasource.dart';
import 'package:whashlist/features/livretermine/data/models/livretermine_model.dart';
import 'package:whashlist/features/livretermine/domain/entities/livretermine_entity.dart';
import 'package:whashlist/features/livretermine/domain/repositories/livretermine_repository.dart';

class LivreTermineRepositoryImpl implements LivreTermineRepository {
  final LivretermineService apiService;
  const LivreTermineRepositoryImpl(this.apiService);

  @override
  Future<DataState<LivreTermineResponseModel>> createlivretermine(
      {CreateLivreTermineRequestEntity? body}) async {
    try {
      final response = await apiService.createlivretermine(
        body: CreateLivreTermineRequestModel.fromEntity(body!),
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
  Future<DataState<List<ApiBookResponseModel>>> listlivretermine(
      {String? id}) async {
    try {
      final response = await apiService.listlivretermine(
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
  Future<DataState<void>> deletelivretermine({String? id}) async {
    try {
      final response = await apiService.deletelivretermine(
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
