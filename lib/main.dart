
import 'dart:async';
import 'dart:convert' show json;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/add_task/add_task.dart';
import 'package:firebase_demo/api/firebase_api.dart';
import 'package:firebase_demo/api/firebase_api.dart';
import 'package:firebase_demo/api/firebase_api.dart';
import 'package:firebase_demo/app_theam.dart';
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
import 'package:rxdart/rxdart.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}

Future<void> main()  async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    NotificationServices().requestNotificationPermission();
    NotificationServices().InitNotification();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }catch (e){
    print(e);
  }
  Googel_Signin.login();
  // print("Checking current user  ${Googel_Signin.currentUser}");
  // print("Checking current user  ${Googel_Signin.isAuthorized}");

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