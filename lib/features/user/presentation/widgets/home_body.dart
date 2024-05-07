// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width;
    double buttonHeight = 350.0; // Ajustez cette valeur selon vos préférences de hauteur

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/film');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fixedSize: Size(buttonWidth, buttonHeight),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/movie.jpg'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2),
                            BlendMode.dstATop,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: buttonWidth,
                      height: buttonHeight,
                    ),
                    SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: const Center(
                        child: Text(
                          'FILM',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/livre');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fixedSize: Size(buttonWidth, buttonHeight),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/book.jpg'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2),
                            BlendMode.dstATop,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: buttonWidth,
                      height: buttonHeight,
                    ),
                    SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: const Center(
                        child: Text(
                          'LIVRE',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
