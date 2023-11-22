// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:whashlist/ajoutfilm.dart';
import 'package:whashlist/ajoutlivre.dart';
import 'package:whashlist/booklist.dart';
import 'package:whashlist/main.dart';

import 'movielist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Accueil(),
      title: "Home",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFCE5CB),
        ),
    )
    );
  }
}

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCE5CB),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            '../images/home.png',
            width: 30.0,
          ),
        ),
        title: Center(
          child: Text('HOME'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
              width: 200.0, // Ajustez la largeur du bouton
              height: 60.0, // Ajustez la hauteur du bouton
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AjoutFilms()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue)
                ),
                child: Text('Ajouter un film',
                style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 200.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Movielist()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue)
                ),
                child: Text('Ma Movielist',
                style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 200.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AjoutLivre()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue)
                ),
                child: Text('Ajouter un livre',
                style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 200.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookList()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue)
                ),
                child: Text('Ma Booklist',
                style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}