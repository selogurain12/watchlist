import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/movie/data/models/movie_model.dart';

part 'movie_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @POST("/movie/")
  Future<HttpResponse<ApiMovieResponseModel>> searchmovie ({
    @Body() ApiMovieRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}