import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';
import 'package:whashlist/features/livreencours/data/models/livreencours_model.dart';

part 'livreencours_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LivreEnCoursService {
  factory LivreEnCoursService(Dio dio) = _LivreEnCoursService;

  @POST("/user/me/livresencours")
  Future<HttpResponse<LivreEnCoursResponseModel>> createlivreencours({
    @Body() CreateLivreEnCoursRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/livresencours/{id}")
  Future<HttpResponse<List<ApiBookResponseModel>>> listlivreencours({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @PATCH("/user/me/livresencours/{id}")
  Future<HttpResponse<LivreEnCoursResponseModel>> updatelivreencours({
    @Path('id') String? id,
    @Body() UpdateLivreEnCoursRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/livresencours/{id}")
  Future<HttpResponse<void>> deletelivreencours({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
