abstract class FilmothequeEvent {
  const FilmothequeEvent();
}

class FilmothequesEvent extends FilmothequeEvent {
  final String? id;

  const FilmothequesEvent({
    this.id,
  });
}
