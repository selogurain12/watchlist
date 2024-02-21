import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/book/data/models/book_model.dart';

part 'book_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class BookApiService {
  factory BookApiService(Dio dio) = _BookApiService;

  @POST("/book")
  Future<HttpResponse<List<ApiBookResponseModel>>> searchbook ({
    @Body() ApiBookRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}