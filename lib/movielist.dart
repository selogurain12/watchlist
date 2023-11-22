// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whashlist/main.dart';

class Movielist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCE5CB),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            '../images/movies.png',
            width: 30.0,
          ),
        ),
        title: Center(
          child: Text('MOVIES'),
        ),
      ),
body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Alignez le contenu en haut (à gauche)
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 80.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Accueil()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                child: Center(
                  child: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
