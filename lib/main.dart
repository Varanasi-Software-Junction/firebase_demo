//

// const List<String> scopes = <String>[
//   'email',
//   'https://www.googleapis.com/auth/contacts.readonly',
// ];
//
// GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: 'your-client_id.apps.googleusercontent.com',
//   scopes: scopes,
// );
// // #enddocregion Initialize
//
// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Google Sign In',
//       home: SignInDemo(),
//     ),
//   );
// }

import 'dart:async';
import 'dart:convert' show json;

import 'package:firebase_demo/main.dart';
import 'package:firebase_demo/signin_demo.dart';
import 'package:firebase_demo/utilittis.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_demo/intro_page/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main()  async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }catch (e){
    print(e);
  }
  Googel_Signin.login();
  print("Checking current user  ${Googel_Signin.currentUser}");
  print("Checking current user  ${Googel_Signin.isAuthorized}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}