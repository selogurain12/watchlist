import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/filmencours/data/models/filmencours_model.dart';

part 'filmencours_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FilmEnCoursService {
  factory FilmEnCoursService(Dio dio) = _FilmEnCoursService;

  @POST("/user/me/filmsencours")
  Future<HttpResponse<FilmEnCoursResponseModel>> createfilmencours({
    @Body() CreateFilmEnCoursRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/filmsencours/{id}")
  Future<HttpResponse<List<AllFilmEnCoursResponseModel>>> listfilmencours({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/filmsencours/film/{id}")
  Future<HttpResponse<FilmEnCoursResponseModel>> filmencours({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @PATCH("/user/me/filmsencours/{id}")
  Future<HttpResponse<FilmEnCoursResponseModel>> updatefilmencours({
    @Path('id') String? id,
    @Body() UpdateFilmEnCoursRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/filmsencours/{id}")
  Future<HttpResponse<void>> deletefilmencours({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
