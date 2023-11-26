// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whashlist/inscription.dart';
import 'package:whashlist/main.dart';

class Movielist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCE5CB),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Accueil()),
                  );
                },
                child: Image.asset(
            '../images/home.png',
            width: 30.0,
          ),
        ),
        ),
        title: Center(
          child: Text('MOVIES'),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Naviguer vers la page souhaitée lorsque l'image est cliquée
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inscription()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                '../images/2815428.png',
                width: 80.0,
              ),
            ),
          ),
        ],
      ),
body: Column(
               mainAxisAlignment: MainAxisAlignment.start, // Alignez le contenu en haut (à gauche)
        children: const [
          Center(
            child: Text("Hello")
          )
        ],
      ),
    );
  }
}
