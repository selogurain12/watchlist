abstract class UserEvent {
  const UserEvent();
}

class LoginEvent extends UserEvent {
  final String? mail;
  final String? mdp;

  const LoginEvent({
    this.mail,
    this.mdp,
  });
}

class RegisterEvent extends UserEvent {
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;

  const RegisterEvent({
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  });
}

class SearchEvent extends UserEvent {
  final int? id;
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;

  const SearchEvent({
    this.id,
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
  });
}