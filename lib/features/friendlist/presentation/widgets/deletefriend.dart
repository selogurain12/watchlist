// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_bloc.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_event.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_state.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class DeleteFriend extends StatefulWidget {
  final VoidCallback onFriendDelete;

  const DeleteFriend({Key? key, required this.onFriendDelete})
      : super(key: key);

  @override
  State<DeleteFriend> createState() => _DeleteFriend();
}

class _DeleteFriend extends State<DeleteFriend> {
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
        if (state is DeleteFriendError) {
          String errorMessage;
          if (state.error?.response?.statusCode == 404) {
            errorMessage = 'Utilisateur non trouvé';
          } else {
            errorMessage = 'Une erreur s\'est produite';
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.pop(context);
          });
        }
        if (state is DeleteFriendLoaded) {
          Future.delayed(const Duration(seconds: 2));
          widget.onFriendDelete();
          Navigator.pop(context);
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
                  'Supprimer un ami',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
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
                          content:
                              Text("Veuillez entrer le pseudo de votre ami"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    if (user2.text == userProvider.userUsername) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Vous ne pouvez pas vous supprimer comme ami"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      friendlistBloc.add(
                        DeleteFriendEvent(
                          userprincipal: userProvider.userUsername,
                          user2: user2.text,
                        ),
                      );
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
