import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Googel_Signin{
static const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];
static GoogleSignIn googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);
static GoogleSignInAccount? currentUser;
static bool isAuthorized = false;
}