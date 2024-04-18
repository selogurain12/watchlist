// ignore_for_file: non_constant_identifier_names

abstract class BibliothequeEvent {
  const BibliothequeEvent();
}

class BibliothequesEvent extends BibliothequeEvent {
  final String? id;

  const BibliothequesEvent({
    this.id,
  });
}

class AddBibliothequeEvent extends BibliothequeEvent {
  final String? nom;
  final String? id_user;

  const AddBibliothequeEvent({
    this.nom,
    this.id_user,
  });
}

class RenameBibliothequeEvent extends BibliothequeEvent {
  final String? id;
  final String? nom;
  final String? id_user;

  const RenameBibliothequeEvent({
    this.id,
    this.nom,
    this.id_user,
  });
}

class LivreBibliothequeEvent extends BibliothequeEvent {
  final String? id_livre;
  final String? id_bibliotheque;

  const LivreBibliothequeEvent({
    this.id_livre,
    this.id_bibliotheque,
  });
}

class ListLivreBibliothequeEvent extends BibliothequeEvent {
  final String? id_bibliotheque;

  const ListLivreBibliothequeEvent({
    this.id_bibliotheque,
  });
}

class DeleteBibliothequeEvent extends BibliothequeEvent {
  final String? id_bibliotheque;

  const DeleteBibliothequeEvent({
    this.id_bibliotheque,
  });
}

class DeleteBookBibliothequeEvent extends BibliothequeEvent {
  final String? id_bibliotheque;
  final String? id_book;

  const DeleteBookBibliothequeEvent({
    this.id_bibliotheque,
    this.id_book
  });
}