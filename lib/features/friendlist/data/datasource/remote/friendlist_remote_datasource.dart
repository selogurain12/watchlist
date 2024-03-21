import 'package:retrofit/retrofit.dart';
import 'package:whashlist/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:whashlist/features/friendlist/data/models/friendlist_model.dart';

part 'friendlist_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FriendlistService {
  factory FriendlistService(Dio dio) = _FriendlistService;

  @POST("/friendlist")
  Future<HttpResponse<FriendlistResponseModel>> addfriend ({
    @Body() FriendlistRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/friendlist/userprincipal")
  Future<HttpResponse<List<FriendlistResponseModel>>> listfriend ({
    @Body() UserPrincipalRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });

  @POST("/friendlist/userprincipal/user")
  Future<HttpResponse<FriendlistResponseModel>> searchfriend ({
    @Body() UserFriendRequestModel? body,
    @Header('Content-Type') String? contentType,
    @Header('Accept') String? accept,
  });
}