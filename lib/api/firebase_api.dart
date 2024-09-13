import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  // create an instance of firebase message
  final _firebaseMessaging = FirebaseMessaging.instance;
  // function of initialize notification
  Future<void> initNotifications() async{
    // request permission from usr (will promote usr)
     await _firebaseMessaging.requestPermission();


    //fetch the FCM token for this device
    final fCMTOKEN = await _firebaseMessaging.getToken();

    //print the token
    print('**********************************************Token:  $fCMTOKEN');

  }
  //function to handle receiver message

  // function o initialize foreground and background settings
}