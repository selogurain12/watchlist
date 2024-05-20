
// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class StatsRequestEntity extends Equatable {
  final int? tempsvu;
  final int? pageslu;

  const StatsRequestEntity({
    this.tempsvu,
    this.pageslu
  });

  @override
  List<Object?> get props => [
    tempsvu,
    pageslu
  ];
}

class StatsResponseEntity extends Equatable {
  final String? id;
  final int? tempsvu;
  final int? pageslu;
  final int? filmotheque;
  final int? bibliotheque;
  final int? filmEnCours;
  final int? filmsTermine;
  final int? livreEnCours;
  final int? livresTermine;


  const StatsResponseEntity({
    this.id,
    this.tempsvu,
    this.pageslu,
    this.bibliotheque,
    this.filmEnCours,
    this.filmotheque,
    this.filmsTermine,
    this.livreEnCours,
    this.livresTermine
  });

  @override
  List<Object?> get props => [
    id,
    tempsvu,
    pageslu,
    bibliotheque,
    filmEnCours,
    filmotheque,
    filmsTermine,
    livreEnCours,
    livresTermine
  ];
}
