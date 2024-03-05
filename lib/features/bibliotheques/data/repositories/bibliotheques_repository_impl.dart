import 'package:dio/dio.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/data/datasource/remote/bibliotheques_remote_datasource.dart';
import 'package:whashlist/features/bibliotheques/data/models/bibliotheques_model.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class BibliothequesRepositoryImpl implements BibliothequesRepository {
  final BibliothequesService apiService;
  const BibliothequesRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<BibliothequesResponseModel>>> bibliotheques (
      {BibliothequesRequestEntity? body}) async {
    try {
      final response = await apiService.bibliotheques(
        body: BibliothequesRequestModel.fromEntity(body!),
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
  Future<DataState<BibliothequesResponseModel>> addbibliotheque (
      {AddBibliothequeRequestEntity? body}) async {
    try {
      final response = await apiService.addbibliotheque(
        body: AddBibliothequeRequestModel.fromEntity(body!),
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
  Future<DataState<LivreBibliothequeResponseModel>> addbook (
      {LivreBibliothequeRequestEntity? body}) async {
    try {
      final response = await apiService.addbook(
        body: LivreBibliothequeRequestModel.fromEntity(body!),
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
