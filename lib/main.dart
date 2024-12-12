import 'package:bhm/routes.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boys Hostel Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRoutes, // Use the appRoutes map
    );
  }
}
