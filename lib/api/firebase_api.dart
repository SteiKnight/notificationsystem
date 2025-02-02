import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  //create instance of firebase messaging
  final firebaseMessaging = FirebaseMessaging.instance;

  //function to init notifications
  Future<void> initNotifications() async {
    //request notification permission (prompts user)
    await firebaseMessaging.requestPermission();

    //fetch FCM token for this device
    final fCMToken = await firebaseMessaging.getToken();

    //print the token (normally you would send to server)
    print('FCM Token: $fCMToken');
  }
  //funtion to handle received messages
  // funtion to intit fg and bg settings
}
