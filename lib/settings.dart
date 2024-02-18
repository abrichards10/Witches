// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:witch_unite/language_settings.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFFE9DEFC),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * .08,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                  // Implement your dark mode logic here
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          ListTile(
            title: Text(
              'Language',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageSettingsPage()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Implement logout logic here
            },
          ),
        ],
      ),
    );
  }
}
