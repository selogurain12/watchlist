import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/filmotheques/data/models/filmotheques_model.dart';

part 'filmotheques_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FilmothequesService {
  factory FilmothequesService(Dio dio) = _FilmothequesService;

  @POST("/user/me/filmotheques")
  Future<HttpResponse<List<FilmothequesResponseModel>>> filmotheques ({
    @Body() FilmothequesRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}