import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:go_router/go_router.dart';
import 'package:whashlist/injection_container.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late UserBloc userBloc;
  late TextEditingController mail;
  late TextEditingController mdp;
  final _formKey = GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    userBloc = sl<UserBloc>();
    mail = TextEditingController();
    mdp = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.close();
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
                'Adresse mail :',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.mail,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    hintText: 'Entrer votre adresse e-mail',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    )),
                controller: mail,
              ),
              const SizedBox(height: 15),
              const Text(
                'Mot de passe :',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.security,
                    color: Color.fromRGBO(0, 0, 0, 1),
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
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  onPressed: () {
                    userBloc.add(
                      LoginEvent(
                        mail: mail.text,
                        mdp: mdp.text,
                      ),
                    );
                    context.go('/search');
                  },
                  child: const Text(
                    'Connexion',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
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