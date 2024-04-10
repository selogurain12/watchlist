// ignore_for_file: non_constant_identifier_names

abstract class FilmothequeEvent {
  const FilmothequeEvent({String? id});
}

class FilmothequesEvent extends FilmothequeEvent {
  final String? id;

  const FilmothequesEvent({
    this.id,
  });
}

class AddFilmothequeEvent extends FilmothequeEvent {
  final String? nom;
  final String? id_user;

  const AddFilmothequeEvent({
    this.nom,
    this.id_user,
  });
}

class RenameFilmothequeEvent extends FilmothequeEvent {
  final String? id;
  final String? nom;
  final String? id_user;

  const RenameFilmothequeEvent({
    this.id,
    this.nom,
    this.id_user,
  });
}

class FilmFilmothequeEvent extends FilmothequeEvent {
  final String? id_film;
  final String? id_filmotheque;

  const FilmFilmothequeEvent({
    this.id_film,
    this.id_filmotheque,
  });
}

class ListFilmFilmothequeEvent extends FilmothequeEvent {
  final String? id_filmotheque;

  const ListFilmFilmothequeEvent({
    this.id_filmotheque,
  });
}

class DeleteFilmothequeEvent extends FilmothequeEvent {
  final String? id_filmotheque;

  const DeleteFilmothequeEvent({
    this.id_filmotheque,
  });
}

class DeleteMovieFilmothequeEvent extends FilmothequeEvent {
  final String? id_filmotheque;
  final String? id_movie;

  const DeleteMovieFilmothequeEvent({
    this.id_filmotheque,
    this.id_movie
  });
}
