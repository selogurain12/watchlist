import 'package:whashlist/features/stats/domain/entities/stats_entity.dart';

abstract class StatEvent {
  const StatEvent();
}

class UpdateStatEvent extends StatEvent {
  final String? id;
  final StatsRequestEntity? update;

  const UpdateStatEvent({
    this.id,
    this.update,
  });
}

class StatsEvent extends StatEvent {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? username;
  final String? mail;

  const StatsEvent({
    this.id,
    this.nom,
    this.prenom,
    this.username,
    this.mail
  });
}
