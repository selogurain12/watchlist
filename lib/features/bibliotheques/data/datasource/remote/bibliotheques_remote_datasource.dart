import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/data/models/bibliotheques_model.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'bibliotheques_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class BibliothequesService {
  factory BibliothequesService(Dio dio) = _BibliothequesService;

  @POST("/user/me/bibliotheque")
  Future<HttpResponse<BibliothequeResponseModel>> createbibliotheque({
    @Body() CreateBibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/bibliotheque")
  Future<HttpResponse<List<BibliothequeResponseModel>>> listbibliotheque({
    @Body() UserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/bibliotheque/{id}")
  Future<HttpResponse<List<ApiBookResponseModel>>> listbook({
    @Path('id') String? idbibliotheque,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @PATCH("/user/me/bibliotheque/{id}")
  Future<HttpResponse<BibliothequeResponseModel>> modifiebibliotheque({
    @Path('id') String? idbibliotheque,
    @Body() CreateBibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @PATCH("/user/me/bibliotheque/livre/{id}")
  Future<HttpResponse<BibliothequeResponseModel>> deletebook({
    @Path('id') String? idbibliotheque,
    @Body() DeleteLivreRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/bibliotheque/user/{id}")
  Future<HttpResponse<BibliothequeResponseModel>> deleteuserinbibliotheque({
    @Path('id') String? idbibliotheque,
    @Body() UserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/bibliotheque/{id}")
  Future<HttpResponse<void>> deletebibliotheque({
    @Path('id') String? idbibliotheque,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
