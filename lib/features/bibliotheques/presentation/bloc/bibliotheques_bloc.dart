import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/createbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deleteuserinbibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/listbibliotheques.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deletebibliotheque.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/deletebook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/listbook.dart';
import 'package:whashlist/features/bibliotheques/domain/usecases/modifiebibliotheque.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_event.dart';
import 'package:whashlist/features/bibliotheques/presentation/bloc/bibliotheques_state.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class BibliothequesBloc extends Bloc<BibliothequeEvent, BibliothequeState> {
  final DeleteBookUseCase deleteBookUseCase;
  final CreateBibliothequeUseCase createbibliothequeUseCase;
  final DeleteUserinBibliothequeUseCase deleteuserinbibliothequeUseCase;
  final DeleteBibliothequeUseCase deletebibliothequeUseCase;
  final ListBibliothequeUseCase listBibliothequeUseCase;
  final ListLivreUseCase listLivreUseCase;
  final ModifieBibliothequeUseCase modifieBibliothequeUseCase;

  BibliothequesBloc(
    this.deleteBookUseCase,
    this.createbibliothequeUseCase,
    this.deleteuserinbibliothequeUseCase,
    this.deletebibliothequeUseCase,
    this.listBibliothequeUseCase,
    this.listLivreUseCase,
    this.modifieBibliothequeUseCase,
  ) : super(const BibliothequesLoading()) {
    on<DeleteBookEvent>(deletebook);
    on<CreateBibliothequeEvent>(createbibliotheque);
    on<DeleteUserinBibliothequeEvent>(deleteuserinbibliotheque);
    on<DeleteBibliothequeEvent>(deletebibliotheque);
    on<ListBibliothequeEvent>(listbibliotheque);
    on<ListLivreEvent>(listlivre);
    on<ModifieBibliothequeEvent>(modifiebibliotheque);
  }

  void deletebook(
      DeleteBookEvent event, Emitter<BibliothequeState> emit) async {
    emit(const BibliothequesLoading());
    final data = await deleteBookUseCase(
      params: DeleteBookParams(
        idbibliotheque: event.id,
        body: event.livreIds,
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteBookLoaded(deletebook: data.data));
    }

    if (data is DataFailure) {
      emit(DeleteBookError(data.error));
    }
  }

  void createbibliotheque(
      CreateBibliothequeEvent event, Emitter<BibliothequeState> emit) async {
    emit(const BibliothequesLoading());
    final data = await createbibliothequeUseCase(
      params: CreateBibliothequeRequestEntity(
        nom: event.nom,
        users: event.users,
      ),
    );

    if (data is DataSuccess) {
      emit(CreateBibliothequeLoaded(createbibliotheque: data.data));
    }

    if (data is DataFailure) {
      emit(CreateBibliothequeError(data.error));
    }
  }

  void deleteuserinbibliotheque(
      DeleteUserinBibliothequeEvent event, Emitter<BibliothequeState> emit) async {
    emit(const BibliothequesLoading());
    final data = await deleteuserinbibliothequeUseCase(
      params: DeleteUserInBibliothequeParams(
        idbibliotheque: event.id_bibliotheque,
        body: event.user,
      ),
    );

    if (data is DataSuccess) {
      emit(DeleteUserinBibliothequeLoaded(deleteuserinbibliotheque: data.data));
    }

    if (data is DataFailure) {
      emit(DeleteUserinBibliothequeError(data.error));
    }
  }

  void deletebibliotheque(
      DeleteBibliothequeEvent event, Emitter<BibliothequeState> emit) async {
    emit(const BibliothequesLoading());
    final data = await deletebibliothequeUseCase(
      params: event.id_bibliotheque,
    );

    if (data is DataSuccess) {
      emit(DeleteBibliothequeLoaded());
    }

    if (data is DataFailure) {
      emit(DeleteBibliothequeError(data.error));
    }
  }

  void listbibliotheque(
      ListBibliothequeEvent event, Emitter<BibliothequeState> emit) async {
    emit(const BibliothequesLoading());
    final data = await listBibliothequeUseCase(
      params: UserRequestEntity(
          id: event.id, 
          nom: event.nom, 
          prenom: event.prenom,
          mail: event.mail,
          username: event.username
          ),
    );

    if (data is DataSuccess) {
      emit(ListBibliothequeLoaded(listbibliotheque: data.data));
    }

    if (data is DataFailure) {
      emit(ListBibliothequeError(data.error));
    }
  }

  void listlivre(
      ListLivreEvent event, Emitter<BibliothequeState> emit) async {
    emit(const BibliothequesLoading());
    final data = await listLivreUseCase(
      params: event.id_bibliotheque,
    );

    if (data is DataSuccess) {
      emit(ListLivreLoaded(listbook: data.data));
    }

    if (data is DataFailure) {
      emit(ListLivreError(data.error));
    }
  }

  void modifiebibliotheque(ModifieBibliothequeEvent event,
      Emitter<BibliothequeState> emit) async {
    emit(const BibliothequesLoading());
    final data = await modifieBibliothequeUseCase(
      params: ModifieBibliothequeParams(
        idbibliotheque: event.id_bibliotheque,
        body: CreateBibliothequeRequestEntity(
          id_livres: event.id_livres,
          users: event.users,
          nom: event.nom
        ),
      ),
    );

    if (data is DataSuccess) {
      emit(ModifieBibliothequeLoaded(modifiebibliotheque: data.data));
    }

    if (data is DataFailure) {
      emit(ModifieBibliothequeError(data.error));
    }
  }
}
