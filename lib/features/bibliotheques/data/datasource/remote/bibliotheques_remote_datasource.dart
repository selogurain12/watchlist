import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/data/models/bibliotheques_model.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';

part 'bibliotheques_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class BibliothequesService {
  factory BibliothequesService(Dio dio) = _BibliothequesService;

  @POST("/user/me/listbibliotheques")
  Future<HttpResponse<List<BibliothequesResponseModel>>> bibliotheques ({
    @Body() BibliothequesRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/user/me/addbibliotheque")
  Future<HttpResponse<BibliothequesResponseModel>> addbibliotheque ({
    @Body() AddBibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/user/me/bibliotheque/addbook")
  Future<HttpResponse<LivreBibliothequeResponseModel>> addbook ({
    @Body() LivreBibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/user/me/bibliotheque/listbook")
  Future<HttpResponse<List<ApiBookResponseModel>>>
      bibliothequebook({
    @Body() ListLivreBibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/user/me/renamebibliotheque")
  Future<HttpResponse<BibliothequesResponseModel>>
      renamebibliotheque({
    @Body() BibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/bibliotheque")
  Future<HttpResponse<void>>
      deletebibliotheque({
    @Body() ListLivreBibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/bibliotheque/book")
  Future<HttpResponse<void>>
      deletebookbibliotheque({
    @Body() LivreBibliothequeRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}