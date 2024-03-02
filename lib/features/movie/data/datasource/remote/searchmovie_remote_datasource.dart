import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/movie/data/models/searchmovie_model.dart';

part 'searchmovie_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class SearchMovieService {
  factory SearchMovieService(Dio dio) = _SearchMovieService;

  @POST("/movie")
  Future<HttpResponse<List<SearchMovieResponseModel>>> searchmovie ({
    @Body() SearchMovieRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}