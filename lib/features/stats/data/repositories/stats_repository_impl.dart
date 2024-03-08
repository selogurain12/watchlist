import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/stats/data/datasource/remote/stats_remote_datasource.dart';
import 'package:whashlist/features/stats/data/models/stats_model.dart';
import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';
import 'package:whashlist/features/stats/domain/repositories/stats_repository.dart';

class StatsRepositoryImpl implements StatsRepository {
  final StatsService apiService;
  const StatsRepositoryImpl(this.apiService);

  @override
  Future<DataState<UpdateStatsResponseModel>> updatestats (
      {UpdateStatsRequestEntity? body}) async {
    try {
      final response = await apiService.updatestats(
        body: UpdateStatsRequestModel.fromEntity(body!),
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