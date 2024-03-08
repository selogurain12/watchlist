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
