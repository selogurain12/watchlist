// ignore_for_file: non_constant_identifier_names
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

abstract class LivreEnCoursEvent {
  const LivreEnCoursEvent();
}

class CreateLivreEnCoursEvent extends LivreEnCoursEvent {
  final String? id_livre;
  final UserRequestModel? user;
  final int? nbpageslus;

  const CreateLivreEnCoursEvent({this.id_livre, this.user, this.nbpageslus});
}

class DeleteLivreEnCoursEvent extends LivreEnCoursEvent {
  final String? id;

  const DeleteLivreEnCoursEvent({
    this.id,
  });
}

class ListLivreEnCoursEvent extends LivreEnCoursEvent {
  final String? id;

  const ListLivreEnCoursEvent({this.id});
}

class UpdateLivreEnCoursEvent extends LivreEnCoursEvent {
  final String? id;
  final UpdateLivreEnCoursRequestEntity? update;

  const UpdateLivreEnCoursEvent({this.id, this.update});
}
