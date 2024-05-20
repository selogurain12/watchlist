import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/stats/data/models/stats_model.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'stats_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class StatsService {
  factory StatsService(Dio dio) = _StatsService;

  @GET("/user/me/stats")
  Future<HttpResponse<StatsResponseModel>> stats ({
    @Body() UserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @PATCH("/user/me/stats/{id}")
  Future<HttpResponse<StatsResponseModel>> updatestats ({
    @Path('id') String? id,
    @Body() StatsRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}