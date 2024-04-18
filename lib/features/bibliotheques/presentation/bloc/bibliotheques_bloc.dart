import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/addbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/addbook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/bibliotheques.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deletebibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deletebookbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/listbibliothequebook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/renamebibliotheque.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';

class BibliothequesBloc extends Bloc<BibliothequeEvent, BibliothequesState> {
  final BibliothequesUseCase bibliothequesUseCase;
  final AddBibliothequeUseCase addbibliothequeUseCase;
  final LivreBibliothequeUseCase livrebibliothequeUseCase;
  final DeleteBibliothequeUseCase deletebibliothequeUseCase;
  final DeleteBookBibliothequeUseCase deleteBookBibliothequeUseCase;
  final ListLivreBibliothequeUseCase listLivreBibliothequeUseCase;
  final RenameBibliothequeUseCase renameBibliothequeUseCase;

  BibliothequesBloc(
    this.bibliothequesUseCase,
    this.addbibliothequeUseCase,
    this.livrebibliothequeUseCase,
    this.deleteBookBibliothequeUseCase,
    this.deletebibliothequeUseCase,
    this.listLivreBibliothequeUseCase,
    this.renameBibliothequeUseCase,
  ) : super(const BibliothequesLoading()) {
    on<BibliothequesEvent>(bibliotheques);
    on<AddBibliothequeEvent>(addbibliotheque);
    on<LivreBibliothequeEvent>(addbook);
    on<DeleteBibliothequeEvent>(deletebibliotheque);
    on<DeleteBookBibliothequeEvent>(deletebookbibliotheque);
    on<ListLivreBibliothequeEvent>(bibliothequebook);
    on<RenameBibliothequeEvent>(renamebibliotheque);
  }

  void bibliotheques(
      BibliothequesEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await bibliothequesUseCase(
      params: BibliothequesRequestEntity(
        id: event.id,
      ),
    );

    if (data is DataSuccess) {
      emit(BibliothequesLoaded(bibliotheques: data.data));
    }

    if (data is DataFailure) {
      emit(BibliothequesError(data.error));
    }
  }

  void addbibliotheque(
      AddBibliothequeEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await addbibliothequeUseCase(
      params: AddBibliothequeRequestEntity(
        nom: event.nom,
        id_user: event.id_user,
      ),
    );

    if (data is DataSuccess) {
      emit(AddBibliothequeLoaded(addbibliotheque: data.data));
    }

    if (data is DataFailure) {
      emit(BibliothequesError(data.error));
    }
  }

  void addbook(
      LivreBibliothequeEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await livrebibliothequeUseCase(
      params: LivreBibliothequeRequestEntity(
        id_livre: event.id_livre,
        id_bibliotheque: event.id_bibliotheque,
      ),
    );

    if (data is DataSuccess) {
      emit(LivreBibliothequeLoaded(addbook: data.data));
    }

    if (data is DataFailure) {
      emit(LivreBibliothequeError(data.error));
    }
  }

  void bibliothequebook(
      ListLivreBibliothequeEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await listLivreBibliothequeUseCase(
      params: ListLivreBibliothequeRequestEntity(
        id_bibliotheque: event.id_bibliotheque,
      ),
    );

    if (data is DataSuccess) {
      emit(ListLivreBibliothequeLoaded(bibliothequebook: data.data));
    }

    if (data is DataFailure) {
      emit(ListLivreBibliothequeError(data.error));
    }
  }

  void renamebibliotheque(
      RenameBibliothequeEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await renameBibliothequeUseCase(
      params: BibliothequeRequestEntity(
          id: event.id, nom: event.nom, id_user: event.id_user),
    );

    if (data is DataSuccess) {
      emit(RenameBibliothequeLoaded(renamebibliotheque: data.data));
    }

    if (data is DataFailure) {
      emit(RenameBibliothequeError(data.error));
    }
  }

  void deletebibliotheque(
      DeleteBibliothequeEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await deletebibliothequeUseCase(
      params: ListLivreBibliothequeRequestEntity(
        id_bibliotheque: event.id_bibliotheque,
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteBibliothequeLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteBibliothequeError(data.error));
    }
  }

  void deletebookbibliotheque(DeleteBookBibliothequeEvent event,
      Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await deleteBookBibliothequeUseCase(
      params: LivreBibliothequeRequestEntity(
        id_bibliotheque: event.id_bibliotheque,
        id_livre: event.id_book,
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteBookBibliothequeLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteBookBibliothequeError(data.error));
    }
  }
}
