import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/user/presentation/bloc/user_bloc.dart';
import 'package:whashlist/features/user/presentation/bloc/user_event.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late UserBloc userBloc;
  late TextEditingController username;
  late TextEditingController mdp;
  final _formKey = GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    userBloc = sl<UserBloc>();
    username = TextEditingController();
    mdp = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.close();
    username.dispose();
    mdp.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      bloc: userBloc,
      listener: (context, state) {
        if (state is UserError) {
      String errorMessage;
      if (state.error?.response?.statusCode == 401) {
        errorMessage = 'Non autorisé (le pseudo ou le mot de passe sont peut-être faux)';
      } else if (state.error?.response?.statusCode == 404) {
        errorMessage = 'Utilisateur non trouvé';
      } else {
        errorMessage = 'Une erreur s\'est produite';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
    else if (state is UserLoaded) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(
        id: state.login?.id,
        prenom: state.login?.prenom,
        nom: state.login?.nom,
        username: state.login?.username,
      );
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.login();
      context.go("/connected");
    }
      },
      child: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pseudo :',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    hintText: 'Entrer votre adresse pseudo',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  controller: username,
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
                          username: username.text,
                          mdp: mdp.text,
                        ),
                      );
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
      ),
    );
  }
}
