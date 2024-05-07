import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_bloc.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_event.dart';
import 'package:whashlist/features/friendlist/presentation/bloc/friendlist_state.dart';
import 'package:whashlist/features/friendlist/presentation/widgets/addfriend.dart';
import 'package:whashlist/features/friendlist/presentation/widgets/deletefriend.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

class CompteBody extends StatefulWidget {
  const CompteBody({Key? key}) : super(key: key);

  @override
  State<CompteBody> createState() => _CompteBodyState();
}

class _CompteBodyState extends State<CompteBody> {
  late FriendlistBloc friendlistBloc;

  @override
  void initState() {
    super.initState();
    friendlistBloc = sl<FriendlistBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    friendlistBloc.add(ListFriendEvent(
        id: userProvider.userId,
        username: userProvider.userUsername,
        prenom: userProvider.userPrenom,
        nom: userProvider.userNom,
        mail: userProvider.userMail));
  }

  @override
  void dispose() {
    super.dispose();
    friendlistBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return BlocBuilder<FriendlistBloc, FriendlistState>(
      bloc: friendlistBloc,
      builder: (context, state) {
        if (state is ListFriendLoaded) {
          List friends = state.listfriend
            !.expand((friendList) => friendList.friends ?? [])
            .toList();
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.go("/");
                      },
                      child: const Icon(Icons.arrow_back_rounded),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    '${userProvider.userUsername}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go("/stats");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFCE5CB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(45.0),
                      child: const Text(
                        'Voir les statistiques',
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Mes amis',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () async {
                      // ignore: unused_local_variable
                      final result = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return AddFriend(
                              onFriendAdded: () {
                                friendlistBloc.add(ListFriendEvent(
                                    id: userProvider.userId,
                                    username: userProvider.userUsername,
                                    prenom: userProvider.userPrenom,
                                    nom: userProvider.userNom,
                                    mail: userProvider.userMail));
                              },
                            );
                          });
                    },
                    child: const Text("Ajouter un ami"),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () async {
                      // ignore: unused_local_variable
                      final result = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return DeleteFriend(
                              onFriendDelete: () {
                                friendlistBloc.add(ListFriendEvent(
                                    id: userProvider.userId,
                                    username: userProvider.userUsername,
                                    prenom: userProvider.userPrenom,
                                    nom: userProvider.userNom,
                                    mail: userProvider.userMail));
                              },
                            );
                          });
                    },
                    child: const Text("Supprimer un ami"),
                  ),
                ]),
                const SizedBox(height: 20),
                Container(
  width: MediaQuery.of(context).size.width * 0.9,
  height: MediaQuery.of(context).size.height * 0.4,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: friends.isEmpty
      ? const Center(
          child: Text("Aucun ami trouvé"),
        )
      : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10, // Espacement horizontal entre les éléments
            mainAxisSpacing: 10, // Espacement vertical entre les éléments
            childAspectRatio: 3 / 1, // Ratio largeur/hauteur des éléments de la grille
          ),
          itemCount: friends.length,
          itemBuilder: (context, index) {
            final UserResponseModel friend = friends[index];
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFCE5CB).withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  friend.username ?? "Username non disponible",  // Gère les valeurs nulles
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                )
              ),
            );
          },
        ),
),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    authProvider.logout();
                    context.go("/");
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20.0),
                      padding: const EdgeInsets.all(30.0)),
                  child: const Text("Déconnexion"),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
