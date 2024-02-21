
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';

part 'user_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @POST("/users/auth/login")
  Future<HttpResponse<LoginUserResponseModel>> login({
    @Body() LoginUserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/users/auth/sign-up")
  Future<HttpResponse<RegisterUserResponseModel>> register({
    @Body() RegisterUserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/users/{id}")
  Future<HttpResponse<SearchUserResponseModel>> searchuser({
    @Path('id') int? id,
    @Body() SearchUserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
});

}