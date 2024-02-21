// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:whashlist/main.dart';

// class Inscription extends StatelessWidget {
//   final TextEditingController _nomController = TextEditingController();
//   final TextEditingController _prenomController = TextEditingController();
//   final TextEditingController _mailController = TextEditingController();
//   final TextEditingController _motDePasseController = TextEditingController();
//   final TextEditingController _confirmationMotDePasseController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFCE5CB),
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Accueil()),
//               );
//             },
//             child: Image.asset(
//               '../images/home.png',
//               width: 30.0,
//             ),
//           ),
//         ),
//         title: Center(
//           child: Text('INSCRIPTION'),
//         ),
//       ),
//       body: Center(
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
//                       offset: Offset(0, 3), // Décalage de l'ombre vers le bas
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: _nomController,
//                   decoration: InputDecoration(
//                     hintText: 'Entrez votre nom...',
//                     labelText: 'Nom',
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
//                   controller: _prenomController,
//                   decoration: InputDecoration(
//                     hintText: 'Entrez votre prénom...',
//                     labelText: 'Prénom',
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
//                   controller: _confirmationMotDePasseController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Entrez à nouveau votre mot de passe...',
//                     labelText: 'Confirmation du mot de passe',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Accéder aux valeurs saisies dans les champs de texte
//                   String nom = _nomController.text;
//                   String prenom = _prenomController.text;
//                   String mail = _mailController.text;
//                   String motDePasse = _motDePasseController.text;
//                   String confirmationMotDePasse = _confirmationMotDePasseController.text;

//                   // Faire quelque chose avec ces valeurs (par exemple, valider l'inscription)
//                   // Vous pouvez également les imprimer pour le moment
//                   print('Nom: $nom');
//                   print('Prénom: $prenom');
//                   print('Mail: $mail');
//                   print('Mot de passe: $motDePasse');
//                   print('Confirmation du mot de passe: $confirmationMotDePasse');
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
