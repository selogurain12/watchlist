abstract class StatEvent {
  const StatEvent();
}

class UpdateStatEvent extends StatEvent {
  final String? iduser;
  final int? filmsvu;
  final int? tempsvu;
  final int? livreslu;
  final int? pageslu;

  const UpdateStatEvent({
    this.iduser,
    this.filmsvu,
    this.tempsvu,
    this.livreslu,
    this.pageslu,
  });
}

class StatsEvent extends StatEvent {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? username;

  const StatsEvent({
    this.id,
    this.nom,
    this.prenom,
    this.username,
  });
}