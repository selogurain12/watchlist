import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/livreencours/data/datasource/remote/livreencours_remote_datasource.dart';
import 'package:whashlist/features/livreencours/data/models/livreencours_model.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';

class LivreEnCoursRepositoryImpl implements LivreEnCoursRepository {
  final LivreEnCoursService apiService;
  const LivreEnCoursRepositoryImpl(this.apiService);

  @override
  Future<DataState<LivreEnCoursResponseModel>> createlivreencours(
      {CreateLivreEnCoursRequestEntity? body}) async {
    try {
      final response = await apiService.createlivreencours(
        body: CreateLivreEnCoursRequestModel.fromEntity(body!),
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
  Future<DataState<List<AllLivreEnCoursResponseModel>>> listlivreencours(
      {String? id}) async {
    try {
      final response = await apiService.listlivreencours(
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
  Future<DataState<LivreEnCoursResponseModel>> livreencours(
      {String? id}) async {
    try {
      final response = await apiService.livreencours(
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
  Future<DataState<LivreEnCoursResponseModel>> updatelivreencours(
      {String? id, UpdateLivreEnCoursRequestEntity? body}) async {
    try {
      final response = await apiService.updatelivreencours(
        id: id,
        body: UpdateLivreEnCoursRequestModel.fromEntity(body!),
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
  Future<DataState<void>> deletelivreencours({String? id}) async {
    try {
      final response = await apiService.deletelivreencours(
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
