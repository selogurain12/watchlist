// ignore_for_file: non_constant_identifier_names
import 'package:whashlist/features/user/data/models/user_model.dart';

abstract class LivreTermineEvent {
  const LivreTermineEvent();
}

class CreateLivreTermineEvent extends LivreTermineEvent {
  final String? id_livre;
  final UserRequestModel? user;

  const CreateLivreTermineEvent({
    this.id_livre,
    this.user,
  });
}

class DeleteLivreTermineEvent extends LivreTermineEvent {
  final String? id;

  const DeleteLivreTermineEvent({
    this.id,
  });
}

class ListLivreTermineEvent extends LivreTermineEvent {
  final String? id;

  const ListLivreTermineEvent(
      {this.id});
}
