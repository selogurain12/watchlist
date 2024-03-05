abstract class UserEvent {
  const UserEvent();
}

class LoginEvent extends UserEvent {
  final String? username;
  final String? mdp;

  const LoginEvent({
    this.username,
    this.mdp,
  });
}

class RegisterEvent extends UserEvent {
  final String? nom;
  final String? prenom;
  final String? mail;
  final String? mdp;
  final String? username;

  const RegisterEvent({
    this.nom,
    this.prenom,
    this.mail,
    this.mdp,
    this.username,
  });
}