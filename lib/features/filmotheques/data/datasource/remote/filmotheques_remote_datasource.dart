import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/filmotheques/data/models/filmotheques_model.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';

part 'filmotheques_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FilmothequesService {
  factory FilmothequesService(Dio dio) = _FilmothequesService;

  @POST("/user/me/filmotheques")
  Future<HttpResponse<List<FilmothequesResponseModel>>> filmotheques({
    @Body() FilmothequesRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/user/me/addfilmotheque")
  Future<HttpResponse<FilmothequesResponseModel>> addfilmotheque({
    @Body() AddFilmothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/user/me/filmotheque/addmovie")
  Future<HttpResponse<FilmFilmothequeResponseModel>> addmovie({
    @Body() FilmFilmothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/user/me/filmotheque/movies")
  Future<HttpResponse<List<SearchMovieResponseModel>>>
      filmothequemovie({
    @Body() ListFilmFilmothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
