// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_bloc.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_event.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_state.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class AddFriend extends StatefulWidget {
  final Function(String)? onFriendAdded; // Déclaration de la fonction de rappel

  const AddFriend({Key? key, this.onFriendAdded}) : super(key: key);

  @override
  State<AddFriend> createState() => _AddFriend();
}


class _AddFriend extends State<AddFriend> {
  late FriendlistBloc friendlistBloc;
  late TextEditingController user2;

  @override
  void initState() {
    super.initState();
    friendlistBloc = sl<FriendlistBloc>();
    user2 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    user2.dispose();
    friendlistBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return BlocBuilder<FriendlistBloc, FriendlistState>(
      bloc: friendlistBloc,
      builder: (context, state) {
        if (state is AddFriendError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("L'utilisateur n'existe pas"),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.of(context).pop();
          });
        }
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Ajouter un ami',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pseudo de l\'utilisateur',
                    ),
                    controller: user2,
                  ),
                ),
                ElevatedButton(
  onPressed: () {
    if (user2.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez entrer le pseudo de votre ami"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final friendName = user2.text; // Nom de l'ami ajouté
      friendlistBloc.add(
        AddFriendEvent(
          userprincipal: userProvider.userUsername,
          user2: friendName,
        ),
      );
      Navigator.of(context).pop(); // Fermer la modale
      widget.onFriendAdded?.call(friendName); // Appeler la fonction de rappel
    }
  },
  child: const Text('Valider'),
),
              ],
            ),
          ),
        );
      },
    );
  }
}
