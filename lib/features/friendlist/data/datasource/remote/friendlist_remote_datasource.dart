import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/friendlist/data/models/friendlist_model.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'friendlist_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FriendlistService {
  factory FriendlistService(Dio dio) = _FriendlistService;

  @PATCH("/user/me/friendslist/{id}")
  Future<HttpResponse<FriendlistResponseModel>> addfriend({
    @Path('id') String? iduser,
    @Body() FriendlistRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/me/friendslist")
  Future<HttpResponse<List<FriendlistResponseModel>>> listfriend({
    @Body() UserRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @GET("/user/{username}")
  Future<HttpResponse<UserResponseModel>> searchuser({
    @Path('username') String? username,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @DELETE("/user/me/friendslist/{id}")
  Future<HttpResponse<void>> deletefriend({
    @Path('id') String? idfriend,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}
