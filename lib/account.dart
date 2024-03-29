// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:witch_unite/prefshelper.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<bool> isSelectedListInterests =
      List.generate(interests.length, (index) => false);
  List<String> thisInterestsList = []; // Initialize list here

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

    return Container(
      color: Color.fromARGB(255, 24, 10, 30),
      child: Stack(
        children: [
          Positioned.fill(
            child: FloatingBubbles(
              duration: 3,
              noOfBubbles: 10,
              colorsOfBubbles: [
                Color.fromARGB(255, 134, 76, 175).withAlpha(30),
                Color.fromARGB(255, 57, 11, 57),
              ],
              sizeFactor: 0.16,
              opacity: 70,
              paintingStyle: PaintingStyle.fill,
              shape: BubbleShape.circle,
              speed: BubbleSpeed.slow,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                'Account',
                style: TextStyle(
                  fontSize: screenWidth * .07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(screenWidth * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap:
                                _getImage, // Call _getImage when the user taps the avatar
                            child: SizedBox(
                              height: screenWidth *
                                  .5, // Set the height dynamically
                              width:
                                  screenWidth * .3, // Set the width dynamically

                              // radius: screenWidth * 0.1,
                              // backgroundImage: _image != null ? FileImage(_image!) : null,
                              child: _image == null
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                          255,
                                          24,
                                          10,
                                          30,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/profile-stock.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundImage: FileImage(_image!),
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 52, 30, 76),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            // border: Border.all(
                            //   color: Color.fromARGB(255, 89, 89, 89),
                            //   width: 3,
                            // ),
                          ),
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 20,
                          ),
                          height: screenWidth * .2,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Image.asset("assets/Owl.png"),
                                iconSize: screenWidth * .09,
                                onPressed: () {
                                  // _matchEngine!.currentItem?.superLike();
                                },
                                //child:  Text("Superlike"),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "You're a Hoot!",
                                    style: TextStyle(
                                      fontSize: screenWidth * .04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Hoo ",
                                        style: TextStyle(
                                          fontSize: screenWidth * .03,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Text(
                                        "liked you: ",
                                        style: TextStyle(
                                          fontSize: screenWidth * .03,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "\t\t27",
                                        style: TextStyle(
                                          fontSize: screenWidth * .04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    Text(
                      'Interests 👀',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: List.generate(
                          PrefsHelper().savedInterests.length, (index) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: isSelectedListInterests[index]
                                ? Color.fromARGB(255, 207, 187, 224)
                                : Color.fromARGB(255, 242, 223, 254),
                            padding: EdgeInsets.fromLTRB(
                              screenWidth * .02,
                              0,
                              screenWidth * .02,
                              0,
                            ),
                            elevation: 3,
                            shadowColor: Colors.deepPurple,
                            side: BorderSide(
                              width: 2,
                              color: isSelectedListInterests[index]
                                  ? Color.fromARGB(255, 111, 93, 135)
                                  : Color.fromARGB(255, 177, 151, 199),
                            ),
                          ),
                          child: Text(
                            PrefsHelper().savedInterests[index],
                            style: TextStyle(
                              fontSize: screenWidth * .04,
                            ),
                          ),
                          onPressed: () {
                            if (isSelectedListInterests[index]) {
                              thisInterestsList
                                  .remove(PrefsHelper().savedInterests[index]);
                            } else {
                              thisInterestsList
                                  .add(PrefsHelper().savedInterests[index]);
                            }

                            isSelectedListInterests[index] =
                                !isSelectedListInterests[index];
                            PrefsHelper().savedInterests = thisInterestsList;
                            print("Interests ${PrefsHelper().savedInterests}");
                            setState(() {});
                          },
                        );
                      }),
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    Text(
                      'Hobbies 🧹',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    Text(
                      'Mischiefs 😈',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
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
                        PrefsHelper().accountName,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
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
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        PrefsHelper().accountEmail,
                        style: TextStyle(
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
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          _showPasswordDialog();
                        },
                      ),
                    ),
                    SizedBox(height: screenWidth * .05),
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
                          color: Colors.white,
                        ),
                      ),
                      value: false,
                      onChanged: (value) {},
                    ),
                    SwitchListTile(
                      title: Text(
                        'Push Notifications',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showUsernameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Change Username',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            controller:
                _usernameController, // Set controller for the new username text field
            decoration: InputDecoration(
              hintText: 'Enter new username',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _usernameController.text = _usernameController.text;
                  PrefsHelper().accountName = _usernameController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEmailDialog() {
    _emailController.text = PrefsHelper().accountEmail; // Set initial value
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Change Email',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Enter new email',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  PrefsHelper().accountEmail = _emailController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPasswordDialog() {
    _passwordController.text = ''; // Set initial value
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Change Password',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter new password',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add functionality to change password
                setState(() {
                  // Update password with new value
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
