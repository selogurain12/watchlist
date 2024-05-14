// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

class FilmTermineResponseEntity extends Equatable {
  final String? id;
  final String? id_film;
  final UserResponseModel? user;

  const FilmTermineResponseEntity({
    this.id,
    this.id_film,
    this.user
  });

  @override
  List<Object?> get props => [
    id,
    id_film,
    user
  ];
}

class CreateFilmTermineRequestEntity extends Equatable {
  final String? id_film;
  final UserRequestModel? user;

  const CreateFilmTermineRequestEntity({
    this.id_film,
    this.user
  });

  @override
  List<Object?> get props => [
    id_film,
    user
  ];
}
