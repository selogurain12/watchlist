import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/friendlist/data/datasource/remote/friendlist_remote_datasource.dart';
import 'package:whashlist/features/friendlist/data/models/friendlist_model.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';

class FriendlistRepositoryImpl implements FriendlistRepository {
  final FriendlistService apiService;
  const FriendlistRepositoryImpl(this.apiService);

  @override
  Future<DataState<FriendlistResponseModel>> addfriend (
      {FriendlistRequestEntity? body}) async {
    try {
      final response = await apiService.addfriend(
        body: FriendlistRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 201) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<List<FriendlistResponseModel>>> listfriend (
      {UserPrincipalRequestEntity? body}) async {
    try {
      final response = await apiService.listfriend(
        body: UserPrincipalRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 201) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

   @override
  Future<DataState<FriendlistResponseModel>> searchfriend (
      {UserFriendRequestEntity? body}) async {
    try {
      final response = await apiService.searchfriend(
        body: UserFriendRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 201) {
        // await _getAndSaveToken();
        return DataSuccess(response.data);
      } else {
        return DataFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }
}
