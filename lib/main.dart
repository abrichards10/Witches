// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witch_unite/home.dart';

void main() {
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
        fontFamily: GoogleFonts.labrada().fontFamily,
        // fontFamily: GoogleFonts.eagleLake().fontFamily,
        // fontFamily: GoogleFonts.quando().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 29, 12, 36),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.labrada().fontFamily,
          ),
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFE9DEFC),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: Color.fromARGB(255, 24, 10, 30),
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
