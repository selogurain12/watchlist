import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/livreencours/domain/usecases/createlivreencours.dart';
import 'package:whashlist/features/livreencours/domain/usecases/deletelivreencours.dart';
import 'package:whashlist/features/livreencours/domain/usecases/listlivreencours.dart';
import 'package:whashlist/features/livreencours/domain/usecases/updatelivreencours.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_event.dart';
import 'package:whashlist/features/livreencours/presentation/bloc/livreencours_state.dart';

class LivreEnCoursBloc extends Bloc<LivreEnCoursEvent, LivreEnCoursState> {
  final DeleteLivreEnCoursUseCase deletelivreencoursUseCase;
  final CreateLivreEnCoursUseCase createlivreencoursUseCase;
  final ListLivreEnCoursUseCase listlivreencoursUseCase;
  final UpdateLivreEnCoursUseCase updatelivreencoursUseCase;

  LivreEnCoursBloc(
    this.deletelivreencoursUseCase,
    this.createlivreencoursUseCase,
    this.listlivreencoursUseCase,
    this.updatelivreencoursUseCase,
  ) : super(const LivreEnCoursLoading()) {
    on<DeleteLivreEnCoursEvent>(deletelivreencours);
    on<CreateLivreEnCoursEvent>(createlivreencours);
    on<ListLivreEnCoursEvent>(listlivreencours);
    on<UpdateLivreEnCoursEvent>(updatelivreencours);
  }

  void deletelivreencours(
      DeleteLivreEnCoursEvent event, Emitter<LivreEnCoursState> emit) async {
    emit(const LivreEnCoursLoading());
    final data = await deletelivreencoursUseCase(
      params: event.id,
    );

    if (data is DataSuccess) {
      emit(DeleteLivreEnCoursLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteLivreEnCoursError(data.error));
    }
  }

  void createlivreencours(
      CreateLivreEnCoursEvent event, Emitter<LivreEnCoursState> emit) async {
    emit(const LivreEnCoursLoading());
    final data = await createlivreencoursUseCase(
      params: CreateLivreEnCoursRequestEntity(
        id_livre: event.id_livre,
        user: event.user,
      ),
    );
    if (data is DataSuccess) {
      emit(CreateLivreEnCoursLoaded(createlivreencours: data.data));
    }

    if (data is DataFailure) {
      emit(CreateLivreEnCoursError(data.error));
    }
  }

  void listlivreencours(
      ListLivreEnCoursEvent event, Emitter<LivreEnCoursState> emit) async {
    emit(const LivreEnCoursLoading());
    final data = await listlivreencoursUseCase(
      params: event.id,
    );
    if (data is DataSuccess) {
      emit(ListLivreEnCoursLoaded(listlivreencours: data.data));
    }

    if (data is DataFailure) {
      emit(ListLivreEnCoursError(data.error));
    }
  }

  void updatelivreencours(
      UpdateLivreEnCoursEvent event, Emitter<LivreEnCoursState> emit) async {
    emit(const LivreEnCoursLoading());
    final data = await updatelivreencoursUseCase(
      params: UpdateLivreEnCoursParams(
        id: event.id,
        body: event.update,
      ),
    );
    if (data is DataSuccess) {
      emit(UpdateLivreEnCoursLoaded(updatelivreencours: data.data));
    }

    if (data is DataFailure) {
      emit(UpdateLivreEnCoursError(data.error));
    }
  }
}
