// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  List<String> conversations = [];
  List<Widget> conversationImages = [];

  void createNewConversation() {
    setState(() {
      conversations.add('New Conversation ${conversations.length + 1}');

      conversationImages.add(CircleAvatar(
        backgroundImage: AssetImage("assets/profile-stock.jpg"),
        // onPressed: () {},
      ));
    });
  }

  void addPersonToGroupChat() {
    setState(() {
      conversations.add('Group Chat with New Person');
      conversationImages.add(
        Container(
          height: 50,
          width: 80,
          child: Stack(
            children: [
              Positioned(
                left: 30,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/stock_profile.jpg"),
                ),
              ),
              Positioned(
                top: 5,
                left: 10,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile-stock.jpg"),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversations',
          style: TextStyle(
            fontSize: screenWidth * .06,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 52, 30, 76),
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Row(
                children: [
                  conversationImages[index],
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    conversations[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // Navigate to the selected conversation
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: createNewConversation,
            tooltip: 'New Conversation',
            child: Icon(
              Icons.add,
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: addPersonToGroupChat,
            tooltip: 'Add Person to Group Chat',
            child: Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ConversationPage(),
  ));
}
