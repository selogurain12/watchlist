import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_bloc.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_event.dart';
import 'package:whashlist/features/filmotheques/presentation/bloc/filmotheques_state.dart';
import 'package:whashlist/features/user/presentation/bloc/user_state.dart';
import 'package:whashlist/injection_container.dart';

import 'gridmovie.dart';

class ViewFilmotheque extends StatefulWidget {
  const ViewFilmotheque({Key? key}) : super(key: key);

  @override
  State<ViewFilmotheque> createState() => _ViewFilmothequeState();
}

class _ViewFilmothequeState extends State<ViewFilmotheque> {
  late FilmothequesBloc filmothequesBloc;

  @override
  void initState() {
    super.initState();
    filmothequesBloc = sl<FilmothequesBloc>();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    filmothequesBloc.add(FilmothequesEvent(
      id: userProvider.userId,
    ));
  }

  @override
  void dispose() {
    filmothequesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmothequesBloc, FilmothequesState>(
      bloc: filmothequesBloc,
      builder: (context, state) {
        if (state is FilmothequesLoaded) {
          final filmotheques = state.filmotheques;
          return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filmotheques?.length,
              itemBuilder: (context, index) {
                final filmotheque = filmotheques?[index];
                final gridMovieWidget =
                    GridMovie(filmothequeId: filmotheque?.id);
                Future.delayed(const Duration(seconds: 5));

                return InkWell(
                  onTap: () {
                    context.go("/listefilms", extra: filmotheque?.id);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: gridMovieWidget,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.5),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  filmotheque!.nom!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
