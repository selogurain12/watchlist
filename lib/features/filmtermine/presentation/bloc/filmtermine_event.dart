// ignore_for_file: non_constant_identifier_names
import 'package:whashlist/features/user/data/models/user_model.dart';

abstract class FilmTermineEvent {
  const FilmTermineEvent();
}

class CreateFilmTermineEvent extends FilmTermineEvent {
  final String? id_film;
  final UserRequestModel? user;

  const CreateFilmTermineEvent({
    this.id_film,
    this.user,
  });
}

class DeleteFilmTermineEvent extends FilmTermineEvent {
  final String? id;

  const DeleteFilmTermineEvent({
    this.id,
  });
}

class ListFilmTermineEvent extends FilmTermineEvent {
  final String? id;

  const ListFilmTermineEvent(
      {this.id});
}
