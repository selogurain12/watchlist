import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/friendlist/data/datasource/remote/friendlist_remote_datasource.dart';
import 'package:whashlist/features/friendlist/data/models/friendlist_model.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class FriendlistRepositoryImpl implements FriendlistRepository {
  final FriendlistService apiService;
  const FriendlistRepositoryImpl(this.apiService);

  @override
  Future<DataState<FriendlistResponseModel>> addfriend(
      {String? iduser, FriendlistRequestEntity? body}) async {
    try {
      final response = await apiService.addfriend(
        iduser: iduser,
        body: FriendlistRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
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
  Future<DataState<List<FriendlistResponseModel>>> listfriend(
      {UserRequestEntity? body}) async {
    try {
      final response = await apiService.listfriend(
        body: UserRequestModel.fromEntity(body!),
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
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
  Future<DataState<UserResponseModel>> searchuser({String? username}) async {
    try {
      final response = await apiService.searchuser(
        username: username,
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
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
  Future<DataState<void>> deletefriend({String? idfriend}) async {
    try {
      final response = await apiService.deletefriend(
        idfriend: idfriend,
        accept: "application/json",
        contentType: "application/json",
      );
      if (response.response.statusCode == 200) {
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
