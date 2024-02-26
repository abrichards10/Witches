// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  List<String> conversations = [];

  void createNewConversation() {
    setState(() {
      conversations.add('New Conversation ${conversations.length + 1}');
    });
  }

  void addPersonToGroupChat() {
    setState(() {
      conversations.add('Group Chat with New Person');
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
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Text(
                conversations[index],
                style: TextStyle(
                  color: Colors.white,
                ),
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
            onPressed: createNewConversation,
            tooltip: 'New Conversation',
            child: Icon(
              Icons.add,
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
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
