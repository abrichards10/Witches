// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:witch_unite/main.dart';

class LanguageSettingsPage extends StatefulWidget {
  @override
  _LanguageSettingsPageState createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Language Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * .06,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'English',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .04,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                MyApp.of(context)
                    ?.setLocale(Locale.fromSubtags(languageCode: 'en'));
                Navigator.pop(context); // Close the settings page
              },
            ),
          ),
          ListTile(
            title: Text(
              'German',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .04,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                MyApp.of(context)
                    ?.setLocale(Locale.fromSubtags(languageCode: 'de'));
                Navigator.pop(context); // Close the settings page
              },
            ),
          ),
          ListTile(
            title: Text(
              'Spanish',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .04,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                MyApp.of(context)
                    ?.setLocale(Locale.fromSubtags(languageCode: 'sp'));
                Navigator.pop(context); // Close the settings page
              },
            ),
          ),
        ],
      ),
    );
  }
}
