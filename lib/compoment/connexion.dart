// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:whashlist/compoment/inscription.dart';
// import 'package:whashlist/main.dart';

// class Connexion extends StatelessWidget {
//   final TextEditingController _mailController = TextEditingController();
//   final TextEditingController _motDePasseController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
// return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFCE5CB),
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Accueil()),
//                   );
//                 },
//                 child: Image.asset(
//             '../images/home.png',
//             width: 30.0,
//           ),
//         ),
//         ),
//         title: Center(
//           child: Text('BOOKS'),
//         ),
//       actions: [
//           GestureDetector(
//             onTap: () {
//               // Naviguer vers la page souhaitée lorsque l'image est cliquée
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Inscription()),
//               );
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(right: 5.0),
//               child: Image.asset(
//                 '../images/2815428.png',
//                 width: 80.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//  body: Form(
//     key: _formKey,
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           color: Colors.grey[200],
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Chaque champ de saisie est enveloppé dans un Container avec une ombre
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: _mailController,
//                   decoration: InputDecoration(
//                     hintText: 'Entrez votre mail...',
//                     labelText: 'Mail',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: _motDePasseController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Entrez votre mot de passe...',
//                     labelText: 'Mot de passe',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               GestureDetector(
//                 onTap: () {
//                   // Naviguer vers la page d'inscription lorsque le texte est cliqué
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Inscription()),
//                   );
//                 },
//                 child: Text(
//                   'Pas inscrit ? Cliquez ici pour vous inscrire',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Accueil()),
//                   );
//                 },
//                 child: Text('Valider'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
