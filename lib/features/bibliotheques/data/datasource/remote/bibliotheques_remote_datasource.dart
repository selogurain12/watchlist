import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/bibliotheques/data/models/bibliotheques_model.dart';

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
}