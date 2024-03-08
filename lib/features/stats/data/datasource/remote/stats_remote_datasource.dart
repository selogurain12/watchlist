import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/stats/data/models/stats_model.dart';

part 'stats_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class StatsService {
  factory StatsService(Dio dio) = _StatsService;

  @POST("/user/me/updatestats")
  Future<HttpResponse<UpdateStatsResponseModel>> updatestats ({
    @Body() UpdateStatsRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}