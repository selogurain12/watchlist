// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class LivreEnCoursResponseEntity extends Equatable {
  final String? id;
  final String? id_livre;
  final int? nbpageslus;

  const LivreEnCoursResponseEntity({
    this.id,
    this.id_livre,
    this.nbpageslus
  });

  @override
  List<Object?> get props => [
    id,
    id_livre,
    nbpageslus
  ];
}

class CreateLivreEnCoursRequestEntity extends Equatable {
  final String? id_livre;
  final UserRequestModel? user;
  final int? nbpageslus;


  const CreateLivreEnCoursRequestEntity({
    this.id_livre,
    this.user,
    this.nbpageslus
  });

  @override
  List<Object?> get props => [
    id_livre,
    user,
    nbpageslus
  ];
}

class UpdateLivreEnCoursRequestEntity extends Equatable {
  final int? nbpageslus;


  const UpdateLivreEnCoursRequestEntity({
    this.nbpageslus
  });

  @override
  List<Object?> get props => [
    nbpageslus
  ];
}
