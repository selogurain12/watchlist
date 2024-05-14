import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/livretermine/domain/entities/livretermine_entity.dart';
import 'package:whashlist/features/livretermine/domain/usecases/createlivretermine.dart';
import 'package:whashlist/features/livretermine/domain/usecases/deletelivretermine.dart';
import 'package:whashlist/features/livretermine/domain/usecases/listlivretermine.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_event.dart';
import 'package:whashlist/features/livretermine/presentation/bloc/livretermine_state.dart';

class LivreTermineBloc extends Bloc<LivreTermineEvent, LivreTermineState> {
  final DeleteLivreTermineUseCase deletelivreTermineUseCase;
  final CreateLivretermineUseCase createlivretermineUseCase;
  final ListLivreTermineUseCase listlivreTermineUseCase;

  LivreTermineBloc(
    this.deletelivreTermineUseCase,
    this.createlivretermineUseCase,
    this.listlivreTermineUseCase,
  ) : super(const LivreTermineLoading()) {
    on<DeleteLivreTermineEvent>(deletelivreTermine);
    on<CreateLivreTermineEvent>(createlivretermine);
    on<ListLivreTermineEvent>(listlivreTermine);
  }

  void deletelivreTermine(
      DeleteLivreTermineEvent event, Emitter<LivreTermineState> emit) async {
    emit(const LivreTermineLoading());
    final data = await deletelivreTermineUseCase(
      params: event.id,
    );

    if (data is DataSuccess) {
      emit(DeleteLivreTermineLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteLivreTermineError(data.error));
    }
  }

  void createlivretermine(
      CreateLivreTermineEvent event, Emitter<LivreTermineState> emit) async {
    emit(const LivreTermineLoading());
    final data = await createlivretermineUseCase(
      params: CreateLivreTermineRequestEntity(
        id_livre: event.id_livre,
        user: event.user,
      ),
    );
    if (data is DataSuccess) {
      emit(CreateLivreTermineLoaded(createlivretermine: data.data));
    }

    if (data is DataFailure) {
      emit(CreateLivreTermineError(data.error));
    }
  }

  void listlivreTermine(
      ListLivreTermineEvent event, Emitter<LivreTermineState> emit) async {
    emit(const LivreTermineLoading());
    final data = await listlivreTermineUseCase(
      params: event.id,
    );
    if (data is DataSuccess) {
      emit(ListLivreTermineLoaded(listlivretermine: data.data));
    }

    if (data is DataFailure) {
      emit(ListLivreTermineError(data.error));
    }
  }
}
