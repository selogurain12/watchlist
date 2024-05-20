// ignore_for_file: non_constant_identifier_names
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

abstract class FilmEnCoursEvent {
  const FilmEnCoursEvent();
}

class CreateFilmEnCoursEvent extends FilmEnCoursEvent {
  final String? id_film;
  final UserRequestModel? user;
  final int? tempsvisionnage;

  const CreateFilmEnCoursEvent({this.id_film, this.user, this.tempsvisionnage});
}

class DeleteFilmEnCoursEvent extends FilmEnCoursEvent {
  final String? id;

  const DeleteFilmEnCoursEvent({
    this.id,
  });
}

class ListFilmEnCoursEvent extends FilmEnCoursEvent {
  final String? id;

  const ListFilmEnCoursEvent({this.id});
}

class FilmsEnCoursEvent extends FilmEnCoursEvent {
  final String? id;

  const FilmsEnCoursEvent({this.id});
}

class UpdateFilmEnCoursEvent extends FilmEnCoursEvent {
  final String? id;
  final UpdateFilmEnCoursRequestEntity? update;

  const UpdateFilmEnCoursEvent({this.id, this.update});
}
