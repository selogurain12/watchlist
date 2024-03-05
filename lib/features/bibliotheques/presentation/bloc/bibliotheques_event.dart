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

class LivreBibliothequeEvent extends BibliothequeEvent {
  final String? id_livre;
  final String? id_bibliotheque;

  const LivreBibliothequeEvent({
    this.id_livre,
    this.id_bibliotheque,
  });
}