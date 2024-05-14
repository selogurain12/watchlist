// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class LivreTermineResponseEntity extends Equatable {
  final String? id;
  final String? id_livre;
  final UserResponseModel? user;

  const LivreTermineResponseEntity({
    this.id,
    this.id_livre,
    this.user
  });

  @override
  List<Object?> get props => [
    id,
    id_livre,
    user
  ];
}

class CreateLivreTermineRequestEntity extends Equatable {
  final String? id_livre;
  final UserRequestModel? user;

  const CreateLivreTermineRequestEntity({
    this.id_livre,
    this.user
  });

  @override
  List<Object?> get props => [
    id_livre,
    user
  ];
}
