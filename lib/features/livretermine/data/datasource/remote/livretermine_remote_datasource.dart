import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';
import 'package:whashlist/features/livretermine/data/models/livretermine_model.dart';

part 'livretermine_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LivretermineService {
  factory LivretermineService(Dio dio) = _LivretermineService;

  @POST("/user/me/livrestermine")
  Future<HttpResponse<LivreTermineResponseModel>> createlivretermine({
    @Body() CreateLivreTermineRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/livrestermine/{id}")
  Future<HttpResponse<List<ApiBookResponseModel>>> listlivretermine({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/livrestermine/{id}")
  Future<HttpResponse<void>> deletelivretermine({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
