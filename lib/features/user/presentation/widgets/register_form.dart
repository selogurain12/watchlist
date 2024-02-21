import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/injection_container.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late UserBloc userBloc;
  late TextEditingController nom;
  late TextEditingController prenom;
  late TextEditingController mail;
  late TextEditingController mdp;
  final _formKey = GlobalKey<State>();


  @override
  void initState() {
    super.initState();
    userBloc = sl<UserBloc>();
    nom = TextEditingController();
    prenom = TextEditingController();
    mail = TextEditingController();
    mdp = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.close();
    nom.dispose();
    prenom.dispose();
    mail.dispose();
    mdp.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: userBloc,
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nom :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                  ),
                  hintText: 'Entrer votre nom',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                controller: nom,
              ),
              const SizedBox(height: 15),
              const Text(
                'Prenom :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                  ),
                  hintText: 'Entrer votre prenom',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                controller: prenom,
              ),
              const SizedBox(height: 15),
              const Text(
                'Mail :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                  ),
                  hintText: 'Entrer votre adresse e-mail',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                controller: mail,
              ),
              const SizedBox(height: 15),
              const Text(
                'Mot de passe :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.security,
                  ),
                  hintText: 'Entre votre mot de passe',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                controller: mdp,
              ),
              const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.blue,
                      backgroundColor: const Color.fromRGBO(50, 100, 176, 1),
                      fixedSize: const Size(150,40),
                    ),
                    onPressed: () {
                      userBloc.add(
                        RegisterEvent(
                          nom: nom.text,
                          prenom: prenom.text,
                          mail: mail.text,
                          mdp: mdp.text,
                        ),
                      );
                      context.go('/');
                    },
                  child: const Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}