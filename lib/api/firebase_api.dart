import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notificationsystem/main.dart';

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

    //initialize push notifications
    initPushNotifications();
  }

  //funtion to handle received messages
  void handleMessage(RemoteMessage? message) {
    //if the message is null do nothing
    if (message == null) {
      return;
    }

    //navigate to the specific message when message is received
    navigatorKey.currentState
        ?.pushNamed('/notification_screen', arguments: message);
  }

  // funtion to handle bg settings
  Future initPushNotifications() async {
    //handle notification if the app was terminated and now openned
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //attach event listeners for when the notification opens the app from the fg
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
