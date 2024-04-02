// ignore_for_file: non_constant_identifier_names

abstract class FilmothequeEvent {
  const FilmothequeEvent();
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