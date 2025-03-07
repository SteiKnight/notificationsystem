import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notificationsystem/api/firebase_api.dart';
import 'package:notificationsystem/firebase_options.dart';
import 'package:notificationsystem/pages/home_page.dart';
import 'package:notificationsystem/pages/notification_page.dart';


//create a global key for the navigator
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //initialize notifications
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        navigatorKey: navigatorKey,
        routes: {
          '/home': (context) => const HomePage(),
          '/notification_screen': (context) => const NotificationPage(),
        });
  }
}
