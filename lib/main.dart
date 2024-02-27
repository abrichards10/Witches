// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witch_unite/home.dart';
import 'package:witch_unite/onboarding.dart';
import 'package:witch_unite/prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: GoogleFonts.labrada().fontFamily,
        // fontFamily: GoogleFonts.eagleLake().fontFamily,
        // fontFamily: GoogleFonts.quando().fontFamily,
        // fontFamily: GoogleFonts.barriecito().fontFamily,
        // fontFamily: GoogleFonts.caveat().fontFamily,
        // fontFamily: GoogleFonts.shadowsIntoLightTwo().fontFamily, // cool
        // fontFamily: GoogleFonts.indieFlower().fontFamily, // cool
        fontFamily: GoogleFonts.shantellSans().fontFamily, // cool

        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 24, 10, 30),
          titleTextStyle: TextStyle(
            color: Colors.white,
            // fontFamily: GoogleFonts.labrada().fontFamily,
            // fontFamily: GoogleFonts.quando().fontFamily,
            fontFamily: GoogleFonts.shantellSans().fontFamily, // cool
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
      home: OnBoardingPage(),
    );
  }
}
