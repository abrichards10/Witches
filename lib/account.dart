// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  TextEditingController _emailController = TextEditingController();

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: screenWidth * .06,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ), // Change the color of back button
      ),
      body: Container(
        padding: EdgeInsets.all(screenWidth * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap:
                    _getImage, // Call _getImage when the user taps the avatar
                child: Container(
                  height: screenWidth * .3, // Set the height dynamically
                  width: screenWidth * .3, // Set the width dynamically

                  // radius: screenWidth * 0.1,
                  // backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? CircleAvatar(
                          radius: screenWidth * .6,
                          child: Image.asset(
                            "assets/Witch_ICON.png",
                            height: screenWidth * .24,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(_image!),
                        ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            Text(
              'Profile Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenWidth * .04),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'Username',
                style: TextStyle(
                  fontSize: screenWidth * .04,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'user123',
                style: TextStyle(
                  // fontSize: screenWidth * .06,
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  _showUsernameDialog();
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.white,
              ),
              title: Text(
                'Email',
                style: TextStyle(
                  // fontSize: screenWidth * .06,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'user@example.com',
                style: TextStyle(
                  // fontSize: screenWidth * .06,
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  _showEmailDialog();
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              title: Text(
                'Password',
                style: TextStyle(
                  // fontSize: screenWidth * .06,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onTap: () {
                // Handle password editing
              },
            ),
            SizedBox(
              height: screenWidth * .05,
            ),
            Text(
              'Preferences',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenWidth * .04),
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  // fontSize: screenWidth * .06,
                  color: Colors.white,
                ),
              ),
              value: false, // Replace with actual dark mode value
              onChanged: (value) {
                // Handle dark mode toggle
              },
            ),
            SwitchListTile(
              title: Text(
                'Push Notifications',
                style: TextStyle(
                  // fontSize: screenWidth * .06,
                  color: Colors.white,
                ),
              ),
              value: true, // Replace with actual push notification value
              onChanged: (value) {
                // Handle push notification toggle
              },
            ),
            // Add more preferences as needed
          ],
        ),
      ),
    );
  }

  void _showUsernameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Username'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter new username'),
            onChanged: (value) {
              // Handle text field changes
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add functionality to change username
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Email'),
          content: TextField(
            controller: _emailController,
            decoration: InputDecoration(hintText: 'Enter new email'),
            onChanged: (value) {
              // Handle text field changes
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add functionality to change email
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
