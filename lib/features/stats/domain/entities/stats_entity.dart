
// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class UpdateStatsRequestEntity extends Equatable {
  final String? iduser;
  final int? filmsvu;
  final int? tempsvu;
  final int? livreslu;
  final int? pageslu;

  const UpdateStatsRequestEntity({
    this.iduser,
    this.filmsvu,
    this.tempsvu,
    this.livreslu,
    this.pageslu
  });

  @override
  List<Object?> get props => [
    iduser,
    filmsvu,
    tempsvu,
    livreslu,
    pageslu,
  ];
}

class UpdateStatsResponseEntity extends Equatable {
  final String? iduser;
  final int? filmsvu;
  final int? tempsvu;
  final int? livreslu;
  final int? pageslu;


  const UpdateStatsResponseEntity({
    this.iduser,
    this.filmsvu,
    this.tempsvu,
    this.livreslu,
    this.pageslu,
  });

  @override
  List<Object?> get props => [
    iduser,
    filmsvu,
    tempsvu,
    livreslu,
    pageslu,
  ];
}
