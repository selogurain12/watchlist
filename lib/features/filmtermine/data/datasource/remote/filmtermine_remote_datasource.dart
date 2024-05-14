import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/filmtermine/data/models/filmtermine_model.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';

part 'filmtermine_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FilmtermineService {
  factory FilmtermineService(Dio dio) = _FilmtermineService;

  @POST("/user/me/filmstermine")
  Future<HttpResponse<FilmTermineResponseModel>> createfilmtermine({
    @Body() CreateFilmTermineRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/filmstermine/{id}")
  Future<HttpResponse<List<SearchMovieResponseModel>>> listfilmtermine({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/filmstermine/{id}")
  Future<HttpResponse<void>> deletefilmtermine({
    @Path('id') String? id,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
