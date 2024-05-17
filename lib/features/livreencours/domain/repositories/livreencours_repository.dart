import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';

abstract class LivreEnCoursRepository {
  Future<DataState<LivreEnCoursResponseEntity>> createlivreencours({
    CreateLivreEnCoursRequestEntity? body,
  });

  Future<DataState<List<AllLivreEnCoursResponseEntity>>> listlivreencours({
    String? id,
  });

  Future<DataState<LivreEnCoursResponseEntity>> livreencours({
    String? id,
  });

  Future<DataState<LivreEnCoursResponseEntity>> updatelivreencours({
    String? id,
    UpdateLivreEnCoursRequestEntity? body,
  });

  Future<DataState<void>> deletelivreencours({
    String? id,
  });
}