import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/filmotheques/data/models/filmotheques_model.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'filmotheques_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FilmothequesService {
  factory FilmothequesService(Dio dio) = _FilmothequesService;

  @POST("/user/me/filmotheque")
  Future<HttpResponse<FilmothequeResponseModel>> createfilmotheque({
    @Body() CreateFilmothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/filmotheque")
  Future<HttpResponse<List<FilmothequeResponseModel>>> listfilmotheque({
    @Body() UserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/filmotheque/{id}")
  Future<HttpResponse<List<SearchMovieResponseModel>>> listmovie({
    @Path('id') String? idfilmotheque,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @PATCH("/user/me/filmotheque/{id}")
  Future<HttpResponse<FilmothequeResponseModel>> modifiefilmotheque({
    @Path('id') String? idfilmotheque,
    @Body() CreateFilmothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @PATCH("/user/me/filmotheque/film/{id}")
  Future<HttpResponse<FilmothequeResponseModel>> deletemovie({
    @Path('id') String? idfilmotheque,
    @Body() DeleteFilmRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/filmotheque/user/{id}")
  Future<HttpResponse<FilmothequeResponseModel>> deleteuserinfilmotheque({
    @Path('id') String? idfilmotheque,
    @Body() UserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/filmotheque/{id}")
  Future<HttpResponse<void>> deletefilmotheque({
    @Path('id') String? idfilmotheque,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
