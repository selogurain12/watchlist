import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/data/datasource/remote/filmotheques_remote_datasource.dart';
import 'package:whashlist/features/filmotheques/data/models/filmotheques_model.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class FilmothequesRepositoryImpl implements FilmothequesRepository {
  final FilmothequesService apiService;
  const FilmothequesRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<FilmothequesResponseModel>>> filmotheques (
      {FilmothequesRequestEntity? body}) async {
    try {
      final response = await apiService.filmotheques(
        body: FilmothequesRequestModel.fromEntity(body!),
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