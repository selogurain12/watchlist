import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/addbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/addbook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/bibliotheques.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';

class BibliothequesBloc extends Bloc<BibliothequeEvent, BibliothequesState> {
  final BibliothequesUseCase bibliothequesUseCase;
  final AddBibliothequeUseCase addbibliothequeUseCase;
  final LivreBibliothequeUseCase livrebibliothequeUseCase;

  BibliothequesBloc(
    this.bibliothequesUseCase,
    this.addbibliothequeUseCase,
    this.livrebibliothequeUseCase,
  ) : super(const BibliothequesLoading()) {
    on<BibliothequesEvent>(bibliotheques);
    on<AddBibliothequeEvent>(addbibliotheque);
    on<LivreBibliothequeEvent>(addbook);
  }

  void bibliotheques(BibliothequesEvent event, Emitter<BibliothequesState> emit) async {
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

  void addbibliotheque(AddBibliothequeEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await addbibliothequeUseCase(
      params: AddBibliothequeRequestEntity(
        nom: event.nom,
        id_user: event.id_user,
      ),
    );

    if (data is DataSuccess) {
      emit(BibliothequesLoaded(addbibliotheque: data.data));
    }

    if (data is DataFailure) {
      emit(BibliothequesError(data.error));
    }
  }

  void addbook(LivreBibliothequeEvent event, Emitter<BibliothequesState> emit) async {
    emit(const BibliothequesLoading());
    final data = await livrebibliothequeUseCase(
      params: LivreBibliothequeRequestEntity(
        id_livre: event.id_livre,
        id_bibliotheque: event.id_bibliotheque,
      ),
    );

    if (data is DataSuccess) {
      emit(BibliothequesLoaded(addbook: data.data));
    }

    if (data is DataFailure) {
      emit(LivreBibliothequeError(data.error));
    }
  }
}