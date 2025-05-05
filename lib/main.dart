import 'package:diubusbuddy/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'screens/home_page.dart'; // Assuming your home page is in home_page.dart

void main() {
  runApp(BusBuddyApp());
}

class BusBuddyApp extends StatelessWidget {
  const BusBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DIU BusBuddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      
      routes: {
        // '/': (context) => LoginPage(),
        '/': (context) => HomePage(), 
      },
    );
  }
}
