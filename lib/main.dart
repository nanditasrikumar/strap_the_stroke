import 'package:flutter/material.dart';
//import 'package:strap_the_stoke/welcomescreen.dart';
//import 'package:strap_the_stoke/HomeScreen.dart';
// import 'screens/homescreen.dart';

import 'routes.dart';

// This is your starting point, running the main application widget.
void main() {
  runApp(const StrapTheStrokeApp());
}

// The root of your application, defining the overall theme and navigation.
class StrapTheStrokeApp extends StatelessWidget {
  const StrapTheStrokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S.T.R.A.P the Stroke', // App title for the OS
      theme: ThemeData(
        // Define your American Stroke Association inspired theme here
        // Example colors (you'll replace with actual ASA palette adapted for kids)
        primarySwatch: Colors.red, // A vibrant primary color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          // Define your friendly and readable fonts here
          displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18.0),
          labelLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), // For CTA button
        ),
        // Further customize according to ASA branding
      ),
//      home: const HomeScreen(), // Set your HomeScreen as the initial screen
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}