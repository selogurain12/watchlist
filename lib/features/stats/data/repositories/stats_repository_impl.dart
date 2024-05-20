import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/stats/data/datasource/remote/stats_remote_datasource.dart';
import 'package:whashlist/features/stats/data/models/stats_model.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class StatsRepositoryImpl implements StatsRepository {
  final StatsService apiService;
  const StatsRepositoryImpl(this.apiService);

  @override
  Future<DataState<StatsResponseModel>> stats({UserRequestEntity? body}) async {
    try {
      final response = await apiService.stats(
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
  Future<DataState<StatsResponseModel>> updatestats(
      {StatsRequestEntity? body, String? id}) async {
    try {
      final response = await apiService.updatestats(
        id: id,
        body: StatsRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      print(response);
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
      print(e.requestOptions.path);
      return DataFailure(e);
    }
  }
}
